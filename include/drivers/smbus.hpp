#if !defined(_SMBUS_DRIVER_H_)
#define _SMBUS_DRIVER_H_

#include <stdint.h>
#include <stm32l0xx_hal_crc.h>

#include "smbus_constant.hpp"
#include "smbus_i2c.hpp"

class SMBus
{
public:
  SMBus(I2CDriver *i2c_driver);
  ~SMBus();

  // ---- Odd ones ----
  SMBUS_STATUS quick_command(uint8_t command);
  SMBUS_STATUS quick_command(uint8_t address, uint8_t command);
  SMBUS_STATUS send_byte(uint8_t data);
  SMBUS_STATUS receive_byte(uint8_t *response);

  // ---- These commands should be prepended by a select ----
  void select(uint8_t address);
  SMBUS_STATUS write_byte(uint8_t command, uint8_t data);
  SMBUS_STATUS read_byte(uint8_t command, uint8_t *response);
  SMBUS_STATUS write_word(uint8_t command, uint16_t data);
  SMBUS_STATUS read_word(uint8_t command, uint16_t *response);
  SMBUS_STATUS write_32(uint8_t command, uint32_t data);
  SMBUS_STATUS read_32(uint8_t command, uint32_t *response);
  SMBUS_STATUS write_64(uint8_t command, uint64_t data);
  SMBUS_STATUS read_64(uint8_t command, uint64_t *response);
  SMBUS_STATUS write_block(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count);
  SMBUS_STATUS read_block(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_buffer_size, uint8_t *recv_count);
  // Note that process calls uses a Word (uint16_t)!
  SMBUS_STATUS process_call(uint8_t command, uint16_t data, uint16_t *response);
  // User can use the same buffer for send_data_ptr and recv_buffer_ptr if wished
  SMBUS_STATUS block_process_call(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count, uint8_t *recv_buffer_ptr, uint8_t recv_buffer_size, uint8_t *recv_count);

private:
  SMBus_I2C i2c;
  uint8_t target;
  bool target_pec = 1;

  SMBUS_STATUS write_transaction(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count);
  SMBUS_STATUS read_transaction(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_count);

  SMBUS_STATUS begin(uint8_t addr, uint8_t command);
  SMBUS_STATUS end();
};

#endif // _SMBUS_DRIVER_H_