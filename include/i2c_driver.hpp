#if !defined(_I2C_H_)
#define _I2C_H_

#include <stdint.h>
#include <stm32l0xx_hal.h>
#include <stm32l0xx_hal_gpio.h>
#include <stm32l0xx_hal_tim.h>

#include "main.hpp"
#include "i2c_timing.h"

typedef enum
{
  I2C_RESPONSE_ACK,
  I2C_RESPONSE_NACK,
} I2C_RESPONSE;

typedef enum
{
  I2C_RW_WRITE = 0,
  I2C_RW_READ = 1,
} I2C_RW;

typedef enum
{
  I2C_DRIVER_STATE_STOPPED,
  I2C_DRIVER_STATE_STARTED,
  I2C_DRIVER_STATE_WRITING,
  I2C_DRIVER_STATE_READING,
} I2C_DRIVER_STATE;

class I2CDriver
{
public:
  I2CDriver(uint32_t SCL_Pin, GPIO_TypeDef *SCL_Port, uint32_t SDA_Pin, GPIO_TypeDef *SDA_Port, I2C_TIMING *timing);
  ~I2CDriver();

  void write(uint8_t addr, uint8_t data);

private:
  uint32_t SCL_Pin;
  GPIO_TypeDef *SCL_Port;
  uint32_t SDA_Pin;
  GPIO_TypeDef *SDA_Port;
  uint8_t cyle_us;
  I2C_TIMING *timing;
  I2C_DRIVER_STATE state;

  I2C_RESPONSE select(uint8_t addr, uint8_t rw);
  I2C_RESPONSE write_byte(uint8_t data);
  void start_condition();
  void stop_condition();
  I2C_RESPONSE get_ack();
  void clock_stretch();

  void set_scl();
  void clear_scl();
  void set_sda();
  void clear_sda();
  GPIO_PinState read_sda();
  GPIO_PinState read_scl();
};

#endif // _I2C_H_