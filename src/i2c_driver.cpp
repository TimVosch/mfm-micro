#include "i2c_driver.hpp"

// void init_timer()
// {
//   // Set TIMER 6 to us
//   uint8_t psc = SystemCoreClock / 1e6 - 1;
//   __HAL_RCC_TIM6_CLK_ENABLE();
//   TIM6->SR = 0;
//   TIM6->PSC = psc;
//   TIM6->CR1 = TIM_CR1_OPM;
// }

// void delay_us(uint16_t us)
// {
//   TIM6->SR = 0;
//   TIM6->ARR = us;
//   TIM6->CNT = 0;
//   TIM6->CR1 |= TIM_CR1_CEN;
//   while (!(TIM6->SR & TIM_SR_UIF))
//     ;
// }

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
// Utility functions
//
GPIO_PinState I2CDriver::read_sda()
{
  return HAL_GPIO_ReadPin(this->SDA_Port, this->SDA_Pin);
}
GPIO_PinState I2CDriver::read_scl()
{
  return HAL_GPIO_ReadPin(this->SCL_Port, this->SCL_Pin);
}
void I2CDriver::set_sda()
{
  HAL_GPIO_WritePin(this->SDA_Port, this->SDA_Pin, GPIO_PIN_SET);
}
void I2CDriver::set_scl()
{
  HAL_GPIO_WritePin(this->SCL_Port, this->SCL_Pin, GPIO_PIN_SET);
}
void I2CDriver::clear_sda()
{
  HAL_GPIO_WritePin(this->SDA_Port, this->SDA_Pin, GPIO_PIN_RESET);
}
void I2CDriver::clear_scl()
{
  HAL_GPIO_WritePin(this->SCL_Port, this->SCL_Pin, GPIO_PIN_RESET);
}

/**
 * Wait for SCL to go high
 */
void I2CDriver::clock_stretch()
{
  // Wait for clock to actually go high
  TIM6->SR = 0;
  TIM6->ARR = timing->clock_stretch;
  TIM6->CNT = 0;
  TIM6->CR1 |= TIM_CR1_CEN;
  while (!read_scl() && !(TIM6->SR & TIM_SR_UIF))
    ;
}

void I2CDriver::start_condition()
{
  // Repeated start
  if (state == I2C_DRIVER_STATE_STARTED)
  {
    set_sda();
    set_scl();
    delay_us(timing->start_repeat_setup);
  }

  // Start condition
  clear_sda();
  delay_us(timing->start_hold);
  clear_scl();
}

void I2CDriver::stop_condition()
{
  clear_sda();
  set_scl();
  delay_us(timing->stop_setup);
  set_sda();

  // Avoid buslock condition
  delay_us(timing->bus_free / 2);
  if (!read_scl() || !read_sda())
  {
    for (uint8_t i = 0; i < 8; i++)
    {
      set_scl();
      delay_us(timing->high_period);
      clear_scl();
      delay_us(timing->low_period);
    }
    set_scl();
  }

  // Force us to wait before being able to start again
  // delay_us(timing->bus_free);

  // Update state
  state = I2C_DRIVER_STATE_STOPPED;
}

/**
 * Clock in the 9th clock cycle and read the ack bit
 */
I2C_RESPONSE I2CDriver::get_ack()
{

  // 9th Clock cycle
  set_sda();
  set_scl();
  clock_stretch(); // Allow clock stretching before ack
  delay_us(timing->high_period / 2);
  GPIO_PinState sda = read_sda();
  delay_us(timing->high_period / 2);
  clear_scl();
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
  start_condition();
  return write_byte(data);
}

I2C_RESPONSE I2CDriver::write_byte(uint8_t data)
{
  state = I2C_DRIVER_STATE_WRITING;

  // Send 8 bits
  for (int i = 0; i < 8; i++)
  {
    // Setup data line
    if (data & 0x80)
    {
      set_sda();
    }
    else
    {
      clear_sda();
    }
    data <<= 1;

    // Clock in data
    delay_us(timing->data_setup);
    set_scl();
    delay_us(timing->high_period);
    clear_scl();
    delay_us(timing->data_hold);
  }

  // Get the Acknowledgement bit
  return get_ack();
}

//
// Public functions
//

void I2CDriver::write(uint8_t addr, uint8_t data)
{
  I2C_RESPONSE res = select(addr, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    stop_condition();
    return;
  }
  write_byte(data);
  stop_condition();
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
                                           cyle_us{10},
                                           timing{timing},
                                           state{I2C_DRIVER_STATE_STOPPED}
{
  init_timer();
}
I2CDriver::~I2CDriver()
{
}