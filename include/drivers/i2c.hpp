#if !defined(_I2C_H_)
#define _I2C_H_

#include <stdint.h>
#include <stm32l0xx_hal.h>
#include <stm32l0xx_hal_gpio.h>
#include <stm32l0xx_hal_tim.h>

#include "main.hpp"
#include "i2c_timing.hpp"

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

  I2C_RESPONSE start(uint8_t addr, I2C_RW rw);
  I2C_RESPONSE restart(uint8_t addr, I2C_RW rw);
  void stop();
  void ack();
  void nack();
  I2C_RESPONSE write(uint8_t byte);
  uint8_t read();

private:
  uint32_t SCL_Pin;
  GPIO_TypeDef *SCL_Port;
  uint32_t SDA_Pin;
  GPIO_TypeDef *SDA_Port;
  I2C_TIMING *timing;
  I2C_DRIVER_STATE state;

  I2C_RESPONSE select(uint8_t addr, uint8_t rw);
  void start_condition(bool restart);
  void stop_condition();
  I2C_RESPONSE get_ack();
  void clock_stretch();

  void scl_high();
  void scl_low();
  void sda_high();
  void sda_low();
  uint8_t read_sda();
  uint8_t read_scl();
};

#endif // _I2C_H_