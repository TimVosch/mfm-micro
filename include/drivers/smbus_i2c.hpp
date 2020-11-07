#if !defined(_SMBUS_I2C_H_)
#define _SMBUS_I2C_H_

#include <stdint.h>
#include "smbus_constant.hpp"
#include "i2c.hpp"

class SMBus_I2C
{
public:
  bool pec_enabled = 0;

  SMBus_I2C(I2CDriver *i2c);
  ~SMBus_I2C();

  SMBUS_STATUS start(uint8_t addr, I2C_RW rw, bool pec);
  SMBUS_STATUS start(uint8_t addr, I2C_RW rw);
  SMBUS_STATUS restart(uint8_t addr, I2C_RW rw);
  SMBUS_STATUS write(uint8_t byte);
  SMBUS_STATUS write_bytes(uint8_t *send_data_ptr, uint8_t send_count);
  SMBUS_STATUS read_bytes(uint8_t *recv_buffer_ptr, uint8_t recv_count);
  SMBUS_STATUS read(uint8_t *response);
  void stop();
  void ack();
  void nack();

  uint8_t get_pec();

private:
  I2CDriver *i2c;
  I2C_RW cur_dir = I2C_RW_WRITE;
  bool pend_ack = false;
};

#endif // _SMBUS_I2C_H_