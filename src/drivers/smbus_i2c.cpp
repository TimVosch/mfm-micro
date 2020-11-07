#include "drivers/smbus_i2c.hpp"

// ---- utility ----
void __crc_reset()
{
  CRC->CR = CRC_POLYLENGTH_8B;
  CRC->INIT = 0;
  CRC->POL = 0b100000111;
  CRC->CR |= CRC_CR_RESET;

  /*
    CRC is very sensitive to clock cycles so if you're
    not getting the checksum you expected, try inserting
    random nops (no-operation) to wait a clock cycle.
  */
  // __asm("nop");
}

void __crc_write(uint8_t byte)
{
  /*
    Writing 32-bit values to the data register will mess
    up the configuration. The CRC hw will think you're
    trying to checksum a 32 bit value which you are not.

    Cast it to a uint8_t pointer to write 8-bit only.
  */
  *((uint8_t *)&CRC->DR) = byte;
  // __asm("nop");
}

uint8_t __crc_read()
{
  return *((uint8_t *)&CRC->DR);
}

SMBus_I2C::SMBus_I2C(I2CDriver *i2c) : i2c{i2c}
{
}
SMBus_I2C::~SMBus_I2C()
{
}

SMBUS_STATUS SMBus_I2C::start(uint8_t addr, I2C_RW rw, bool pec)
{
  cur_dir = rw;
  pend_ack = false;
  pec_enabled = pec;

  if (pec_enabled)
  {
    __crc_reset();
    __crc_write((addr << 1) | (rw & 1));
  }

  return (SMBUS_STATUS)i2c->start(addr, rw);
}
SMBUS_STATUS SMBus_I2C::start(uint8_t addr, I2C_RW rw)
{
  return start(addr, rw, false);
}

SMBUS_STATUS SMBus_I2C::restart(uint8_t addr, I2C_RW rw)
{
  cur_dir = rw;

  if (pec_enabled)
    __crc_write((addr << 1) | (rw & 1));

  return (SMBUS_STATUS)i2c->restart(addr, rw);
}

SMBUS_STATUS SMBus_I2C::write(uint8_t byte)
{
  if (pec_enabled)
    __crc_write(byte);

  return (SMBUS_STATUS)i2c->write(byte);
}

SMBUS_STATUS SMBus_I2C::write_bytes(uint8_t *send_data_ptr, uint8_t send_count)
{
  if (pec_enabled)
  {
    for (uint8_t i = 0; i < send_count; i++)
    {
      __crc_write(*(send_data_ptr + i));
    }
  }
  return (SMBUS_STATUS)i2c->write_bytes(send_data_ptr, send_count);
}

SMBUS_STATUS SMBus_I2C::read_bytes(uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  auto res = (SMBUS_STATUS)i2c->read_bytes(recv_buffer_ptr, recv_count);
  pend_ack = true;

  if (pec_enabled)
  {
    for (uint8_t i = 0; i < recv_count; i++)
    {
      __crc_write(*(recv_buffer_ptr + i));
    }
  }
  return res;
}

SMBUS_STATUS SMBus_I2C::read(uint8_t *response)
{
  uint8_t data = i2c->read();
  pend_ack = true;

  if (pec_enabled)
    __crc_write(data);

  *response = data;

  return SMBUS_STATUS_OK;
}

void SMBus_I2C::stop()
{
  i2c->stop();
  pend_ack = false;
}

void SMBus_I2C::ack()
{
  i2c->ack();
  pend_ack = false;
}

void SMBus_I2C::nack()
{
  i2c->nack();
  pend_ack = false;
}

uint8_t SMBus_I2C::get_pec()
{
  return __crc_read();
}