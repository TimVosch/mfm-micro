#include "drivers/i2c.hpp"

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

void delay_us(uint16_t _us)
{
  TIM6->CNT = 0;
  uint16_t us = _us;
  if (us <= 2)
  {
    return;
  }
  else
  {
    us -= 2;
  }
  while (TIM6->CNT < us)
    ;
}

//
// ---- Utility functions ----
//
uint8_t I2CDriver::read_sda()
{
  return (this->SDA_Port->IDR & this->SDA_Pin);
}
uint8_t I2CDriver::read_scl()
{
  return (this->SCL_Port->IDR & this->SCL_Pin);
}
void I2CDriver::sda_high()
{
  this->SDA_Port->BSRR = this->SDA_Pin;
}
void I2CDriver::scl_high()
{
  this->SCL_Port->BSRR = this->SCL_Pin;
  clock_stretch();
}
void I2CDriver::sda_low()
{
  this->SDA_Port->BSRR = this->SDA_Pin << 16;
}
void I2CDriver::scl_low()
{
  this->SCL_Port->BSRR = this->SCL_Pin << 16;
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
  TIM6->CNT = 0;
  while (!read_scl() && TIM6->CNT < timing->clock_stretch)
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
}

/**
 * Clock in the 9th clock cycle and read the ack bit
 */
I2C_RESPONSE I2CDriver::get_ack()
{
  // 9th Clock cycle
  sda_high();
  scl_high();
  delay_us(timing->high_period / 2);
  uint8_t sda = read_sda();
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

/**
 * @brief write multiple bytes
 * 
 * @param send_data_ptr buffer ptr with data to send
 * @param send_count the amount of bytes to send
 * @return I2C_RESPONSE 
 */
I2C_RESPONSE I2CDriver::write_bytes(uint8_t *send_data_ptr, uint8_t send_count)
{
  I2C_RESPONSE res;
  for (uint8_t i = 0; i < send_count; i++)
  {
    res = write(*send_data_ptr++);
    if (res != I2C_RESPONSE_ACK)
    {
      return res;
    }
  }

  return res;
}

/**
 * @brief Receive multiple bytes
 * 
 * @param recv_buffer_ptr buffer ptr to store received bytes
 * @param recv_count  amount of bytes to receive
 * @return I2C_RESPONSE 
 */
I2C_RESPONSE I2CDriver::read_bytes(uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  for (uint8_t i = 0; i < recv_count; i++)
  {
    *(recv_buffer_ptr++) = read();

    // Let the caller decide whether to (n)ack the last byte
    if (i < recv_count - 1)
    {
      ack();
    }
  }

  return I2C_RESPONSE_ACK;
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
                                           timing{timing}
{
  init_timer();
}
I2CDriver::~I2CDriver()
{
}