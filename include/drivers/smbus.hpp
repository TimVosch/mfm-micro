#if !defined(_SMBUS_DRIVER_H_)
#define _SMBUS_DRIVER_H_

#include <stdint.h>
#include "i2c.hpp"

typedef enum
{
  SMBUS_STATUS_OK,   // Same as I2C_ACK
  SMBUS_STATUS_NACK, // Same as I2C_NACK
  SMBUS_STATUS_LOST_ARBITRATION,
  SMBUS_STATUS_PEC_FAIL,
  SMBUS_STATUS_OVERFLOW,
} SMBUS_STATUS;

class SMBus
{
public:
  SMBus(I2CDriver *i2c);
  ~SMBus();

  // ---- Odd ones ----
  SMBUS_STATUS quick_command();
  SMBUS_STATUS quick_command(uint8_t address);
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
  I2CDriver *i2c;
  uint8_t target;

  SMBUS_STATUS assert_pec();
  SMBUS_STATUS write_bytes(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count);
  SMBUS_STATUS read_bytes(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_count);
};

#endif // _SMBUS_DRIVER_H_