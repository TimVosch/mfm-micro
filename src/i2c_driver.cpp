#include "i2c_driver.hpp"

void init_timer()
{
  // Set TIMER 6 to us
  uint8_t psc = SystemCoreClock / 1e6 - 1;
  __HAL_RCC_TIM6_CLK_ENABLE();
  TIM6->SR = 0;
  TIM6->PSC = psc;
  TIM6->CR1 = TIM_CR1_UDIS;
  TIM6->CR1 = TIM_CR1_CEN;
}

void delay_us(uint16_t us)
{
  TIM6->CNT = 0;
  while (TIM6->CNT < us)
    ;
}

//
// ---- Utility functions ----
//
GPIO_PinState I2CDriver::read_sda()
{
  return HAL_GPIO_ReadPin(this->SDA_Port, this->SDA_Pin);
}
GPIO_PinState I2CDriver::read_scl()
{
  return HAL_GPIO_ReadPin(this->SCL_Port, this->SCL_Pin);
}
void I2CDriver::sda_high()
{
  HAL_GPIO_WritePin(this->SDA_Port, this->SDA_Pin, GPIO_PIN_SET);
}
void I2CDriver::scl_high()
{
  HAL_GPIO_WritePin(this->SCL_Port, this->SCL_Pin, GPIO_PIN_SET);
}
void I2CDriver::sda_low()
{
  HAL_GPIO_WritePin(this->SDA_Port, this->SDA_Pin, GPIO_PIN_RESET);
}
void I2CDriver::scl_low()
{
  HAL_GPIO_WritePin(this->SCL_Port, this->SCL_Pin, GPIO_PIN_RESET);
}

//
// ---- private functions ----
//

/**
 * Wait for SCL to go high
 */
void I2CDriver::clock_stretch()
{
  // Wait for clock to go high
  // or the timeout timer to trigger
  TIM6->SR = 0;
  // TIM6->ARR = timing->clock_stretch;
  TIM6->ARR = 0xFF;
  TIM6->CNT = 0;
  TIM6->CR1 |= TIM_CR1_CEN;
  while (!read_scl() && !(TIM6->SR & TIM_SR_UIF))
    ;
}

void I2CDriver::start_condition(bool restart)
{
  // Repeated start
  if (restart)
  {
    sda_high();
    scl_high();
    delay_us(timing->start_repeat_setup);
  }

  // Start condition
  sda_low();
  delay_us(timing->start_hold);
  scl_low();
}

void I2CDriver::stop_condition()
{
  sda_low();
  scl_high();
  delay_us(timing->stop_setup);
  sda_high();

  // Avoid buslock condition
  delay_us(timing->bus_free / 2);
  if (!read_scl() || !read_sda())
  {
    for (uint8_t i = 0; i < 8; i++)
    {
      scl_high();
      delay_us(timing->high_period);
      scl_low();
      delay_us(timing->low_period);
    }
    scl_high();
  }

  // Update state
  state = I2C_DRIVER_STATE_STOPPED;
}

/**
 * Clock in the 9th clock cycle and read the ack bit
 */
I2C_RESPONSE I2CDriver::get_ack()
{
  // 9th Clock cycle
  sda_high();
  scl_high();
  clock_stretch(); // Allow clock stretching before ack
  delay_us(timing->high_period / 2);
  GPIO_PinState sda = read_sda();
  delay_us(timing->high_period / 2);
  scl_low();
  delay_us(timing->data_hold);

  if (sda == GPIO_PIN_RESET)
  {
    return I2C_RESPONSE_ACK;
  }
  return I2C_RESPONSE_NACK;
}

I2C_RESPONSE I2CDriver::select(uint8_t addr, uint8_t rw)
{
  uint8_t data = (addr << 1) | rw;
  return write(data);
}

//
// ---- Public functions ----
//

void I2CDriver::ack()
{

  // ACk message
  sda_low();
  scl_high();
  delay_us(timing->high_period);
  scl_low();
  sda_high();
}

void I2CDriver::nack()
{
  // ACk message
  sda_high();
  scl_high();
  delay_us(timing->high_period);
  scl_low();
}

I2C_RESPONSE I2CDriver::start(uint8_t addr, I2C_RW rw)
{
  start_condition(false);
  return select(addr, rw);
}

I2C_RESPONSE I2CDriver::restart(uint8_t addr, I2C_RW rw)
{
  start_condition(true);
  return select(addr, rw);
}

void I2CDriver::stop()
{
  stop_condition();
}

/**
 * @brief Write a byte to the slave
 * 
 * @param byte The byte to send
 * @return I2C_RESPONSE
 */
I2C_RESPONSE I2CDriver::write(uint8_t data)
{
  // Send 8 bits
  for (int i = 0; i < 8; i++)
  {
    // Setup data line
    if (data & 0x80)
    {
      sda_high();
    }
    else
    {
      sda_low();
    }
    data <<= 1;

    // Clock in data
    delay_us(timing->data_setup);
    scl_high();
    delay_us(timing->high_period);
    scl_low();
    delay_us(timing->data_hold);
  }

  // Get the Acknowledgement bit
  return get_ack();
}

/**
 * @brief Read a byte from the slave
 * 
 * @param byte The byte to send
 * @return I2C_RESPONSE
 */
uint8_t I2CDriver::read()
{
  uint8_t data = 0;
  for (uint8_t bit_pos = 8; bit_pos > 0; bit_pos--)
  {
    delay_us(timing->low_period);
    scl_high();
    clock_stretch();

    // Insert high bit
    if (read_sda())
    {
      data |= 1 << (bit_pos - 1);
    }
    delay_us(timing->high_period);
    scl_low();
  }

  return data;
}

//
// (De)constructor
//

I2CDriver::I2CDriver(uint32_t SCL_Pin,
                     GPIO_TypeDef *SCL_Port,
                     uint32_t SDA_Pin,
                     GPIO_TypeDef *SDA_Port,
                     I2C_TIMING *timing) : SCL_Pin{SCL_Pin},
                                           SCL_Port{SCL_Port},
                                           SDA_Pin{SDA_Pin},
                                           SDA_Port{SDA_Port},
                                           timing{timing},
                                           state{I2C_DRIVER_STATE_STOPPED}
{
  init_timer();
}
I2CDriver::~I2CDriver()
{
}