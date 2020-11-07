#include "drivers/smbus.hpp"

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

// ---- Odd ones ----
/**
 * @brief Trigger a device quick command
 * 
 * In a quick command the RW bit denotes the command id
 * this is limited to a 1 or a 0
 * 
 * @param address the device address
 * @param command the short quick command id
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::quick_command(uint8_t address, uint8_t command)
{
  auto res = i2c_start(address, (I2C_RW)(command & 1));
  i2c->stop();
  return (SMBUS_STATUS)res;
}

/**
 * @brief Trigger a device quick command
 * 
 * In a quick command the RW bit denotes the command id
 * this is limited to a 1 or a 0
 * 
 * @param address the device address
 * @param command the short quick command id
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::quick_command(uint8_t command)
{
  return quick_command(target, command);
}

/**
 * @brief write a single byte to a device
 * 
 * @param data byte to write
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::send_byte(uint8_t data)
{
  crc_reset();
  auto res = i2c_start(target, I2C_RW_WRITE);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write(data);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = end_command();
  return (SMBUS_STATUS)res;
}

/**
 * @brief Receive a single byte from a device
 * 
 * @param response the byte read
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::receive_byte(uint8_t *response)
{
  crc_reset();
  auto res = i2c_start(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  *response = i2c_read();

  res = end_command();
  return (SMBUS_STATUS)res;
}

// ---- These commands should be prepended by a select ----
/**
 * @brief Select a secondary device on the bus as target for the following commands
 * 
 * @param address the address of the device on the bus
 */
void SMBus::select(uint8_t address)
{
  this->target = address;
}

/**
 * @brief Execute command with one byte
 * 
 * @param command The command id
 * @param data The data
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_byte(uint8_t command, uint8_t data)
{
  auto res = start_command(target, command);

  res = i2c_write(data);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  i2c->stop();
  return SMBUS_STATUS_OK;
}

/**
 * @brief Execute command and receive one byte
 * 
 * @param command The command id
 * @param response The result
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_byte(uint8_t command, uint8_t *response)
{
  auto res = start_command(target, command);

  res = i2c_restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  *response = i2c_read();
  i2c->ack();

  i2c->stop();
  return SMBUS_STATUS_OK;
}

/**
 * @brief Execute command with two bytes
 * 
 * @param command The command id
 * @param data The data bytes
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_word(uint8_t command, uint16_t data)
{
  // build packet to send
  uint8_t buffer[2] = {
      (uint8_t)data,
      (uint8_t)(data >> 8),
  };

  return write_bytes(command, buffer, 2);
}

/**
 * @brief Execute command and receive two bytes
 * 
 * @param command The command id
 * @param response pointer to store response
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_word(uint8_t command, uint16_t *response)
{
  uint8_t buffer[2] = {0};

  auto res = read_bytes(command, buffer, 2);
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  // Build response
  *response = ((uint16_t)buffer[0]) | (buffer[1] << 8);

  return res;
}

/**
 * @brief Execute command with four bytes
 * 
 * @param command The command id
 * @param response The result
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_32(uint8_t command, uint32_t data)
{
  // build packet to send
  uint8_t buffer[4] = {
      (uint8_t)data,
      (uint8_t)(data >> 8),
      (uint8_t)(data >> 16),
      (uint8_t)(data >> 24),
  };

  return write_bytes(command, buffer, sizeof(buffer));
}

/**
 * @brief Execute command and receive four bytes
 * 
 * @param command The command id
 * @param response  pointer to store response
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_32(uint8_t command, uint32_t *response)
{
  uint8_t buffer[4] = {0};

  auto res = read_bytes(command, buffer, sizeof(buffer));
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  // Build response
  *response = ((uint32_t)buffer[0])          //
              | ((uint32_t)buffer[1] << 8)   //
              | ((uint32_t)buffer[1] << 16)  //
              | ((uint32_t)buffer[1] << 24); //

  return res;
}

/**
 * @brief Execute command with eight bytes
 * 
 * @param command The command id
 * @param response The result
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_64(uint8_t command, uint64_t data)
{
  // build packet to send
  uint8_t buffer[8] = {
      (uint8_t)data,
      (uint8_t)(data >> 8),
      (uint8_t)(data >> 16),
      (uint8_t)(data >> 24),
      (uint8_t)(data >> 32),
      (uint8_t)(data >> 40),
      (uint8_t)(data >> 48),
      (uint8_t)(data >> 56),
  };

  return write_bytes(command, buffer, sizeof(buffer));
}

/**
 * @brief Execute command and receive eight bytes
 * 
 * @param command The command id
 * @param response  pointer to store response
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_64(uint8_t command, uint64_t *response)
{
  uint8_t buffer[8] = {0};

  auto res = read_bytes(command, buffer, sizeof(buffer));
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  // Build response
  *response = ((uint64_t)buffer[0])         //
              | ((uint64_t)buffer[1] << 8)  //
              | ((uint64_t)buffer[1] << 16) //
              | ((uint64_t)buffer[1] << 24) //
              | ((uint64_t)buffer[1] << 32) //
              | ((uint64_t)buffer[1] << 40) //
              | ((uint64_t)buffer[1] << 48) //
              | ((uint64_t)buffer[1] << 56);

  return res;
}

/**
 * @brief Execute command with a block of bytes
 * 
 * @param command The command id
 * @param buffer_ptr pointer to buffer with bytes to send
 * @param buffer_size number of bytes to send
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_block(uint8_t command, uint8_t *buffer_ptr, uint8_t buffer_size)
{
  auto res = start_command(target, command);

  res = i2c_write(buffer_size);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write_bytes(buffer_ptr, buffer_size);

  i2c->stop();
  return (SMBUS_STATUS)res;
}

/**
 * @brief Execute command and receive a block of bytes
 * 
 * @param command The command id
 * @param buffer_ptr pointer to buffer to store bytes
 * @param buffer_size maximum size of the buffer
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_block(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_buffer_size, uint8_t *recv_count)
{
  auto res = start_command(target, command);

  i2c_restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  uint8_t block_size = i2c_read();
  // Trying to receive more bytes than the buffer is long
  if (block_size > recv_buffer_size)
  {
    i2c->nack();
    i2c->stop();
    return SMBUS_STATUS_OVERFLOW;
  }
  i2c->ack();

  // TODO: always returns ACK...?
  i2c_read_bytes(recv_buffer_ptr, block_size);
  i2c->nack();

  i2c->stop();

  *recv_count = block_size;
  return (SMBUS_STATUS)res;
}

/**
 * @brief Call a process and send two bytes and receive two bytes
 * 
 * @param command The command id
 * @param data The data to send
 * @param response pointer to store response
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::process_call(uint8_t command, uint16_t data, uint16_t *response)
{
  crc_reset();
  uint8_t buffer[3] = {
      command,
      (uint8_t)data,
      (uint8_t)(data >> 8),
  };

  auto res = i2c_start(target, I2C_RW_WRITE);
  if (res != SMBUS_STATUS_OK)
  {
    return (SMBUS_STATUS)res;
  }

  // Send command and word through using the buffer
  res = i2c_write_bytes(buffer, sizeof(buffer));
  if (res != SMBUS_STATUS_OK)
  {
    return (SMBUS_STATUS)res;
  }

  res = i2c_restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    return (SMBUS_STATUS)res;
  }

  // TODO: always returns ACK...?
  i2c_read_bytes(buffer, 2);
  i2c->nack();

  // Build response
  *response = ((uint16_t)buffer[0]) | (buffer[1] << 8);

  i2c->stop();
  return (SMBUS_STATUS)res;
}

// Use the buffer for sending and receiving data?
/**
 * @brief Call a process on the secondary device
 * 
 * @param command The command id
 * @param send_data_ptr buffer ptr with data to send
 * @param send_data_count amount of bytes to send
 * @param recv_buffer_ptr buffer ptr to store received bytes
 * @param recv_buffer_size maximum size of receive buffer
 * @param recv_count the amount of bytes that were received
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::block_process_call(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count, uint8_t *recv_buffer_ptr, uint8_t recv_buffer_size, uint8_t *recv_count)
{
  auto res = start_command(target, command);

  // Write block

  res = i2c_write(send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write_bytes(send_data_ptr, send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  // Read block
  res = i2c_restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  uint8_t block_size = i2c_read();
  // Trying to receive more bytes than the buffer is long
  if (block_size > recv_buffer_size)
  {
    i2c->nack();
    i2c->stop();
    return SMBUS_STATUS_OVERFLOW;
  }
  i2c->ack();

  // TODO: always returns ACK...?
  i2c_read_bytes(recv_buffer_ptr, block_size);
  i2c->nack();

  i2c->stop();

  *recv_count = block_size;
  return (SMBUS_STATUS)res;
}

// ---- private functions ----

/**
 * @brief Send a command and write an amount of bytes
 * 
 * @param command The command id
 * @param send_data_ptr 
 * @param send_count 
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::write_bytes(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count)
{
  auto res = start_command(target, command);

  res = i2c_write_bytes(send_data_ptr, send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return res;
  }

  res = end_command();
  return (SMBUS_STATUS)res;
}

/**
 * @brief Send a command and receive an amount of bytes
 * 
 * @param command The command id
 * @param recv_buffer_ptr 
 * @param recv_count 
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_bytes(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  auto res = start_command(target, command);

  i2c_restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  // TODO: always returns ACK...?
  i2c_read_bytes(recv_buffer_ptr, recv_count);

  res = end_command();
  return (SMBUS_STATUS)res;
}

void SMBus::crc_reset()
{
  __crc_reset();
}

uint8_t SMBus::crc_read()
{
  return __crc_read();
}

SMBUS_STATUS SMBus::start_command(uint8_t addr, uint8_t command)
{
  crc_reset();
  auto res = i2c_start(target, I2C_RW_WRITE);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write(command);
  if (res != SMBUS_STATUS_OK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  return SMBUS_STATUS_OK;
}

SMBUS_STATUS SMBus::end_command()
{
  auto res = SMBUS_STATUS_OK;
  if (target_pec)
  {
    if (rw == I2C_RW_WRITE)
    {
      i2c->write(crc_read());
    }
    else if (rw == I2C_RW_READ)
    {
      uint8_t receiver_pec = crc_read();
      uint8_t sender_pec = i2c->read();
      if (receiver_pec != sender_pec)
        res = SMBUS_STATUS_PEC_FAIL;
    }
  }

  if (rw == I2C_RW_READ)
  {
    i2c->nack();
  }

  i2c->stop();
  return res;
}

SMBUS_STATUS SMBus::i2c_start(uint8_t addr, I2C_RW rw)
{
  if (target_pec)
    __crc_write((addr << 1) | (rw & 1));

  this->rw = rw;
  return (SMBUS_STATUS)i2c->start(addr, rw);
}

SMBUS_STATUS SMBus::i2c_restart(uint8_t addr, I2C_RW rw)
{
  if (target_pec)
    __crc_write((addr << 1) | (rw & 1));

  this->rw = rw;
  return (SMBUS_STATUS)i2c->restart(addr, rw);
}

/**
 * @brief write a byte to the i2c bus and update the PEC
 * 
 * @param byte 
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::i2c_write(uint8_t byte)
{
  if (target_pec)
    __crc_write(byte);

  return (SMBUS_STATUS)i2c->write(byte);
}

/**
 * @brief read a byte from the i2c bus and update the PEC
 * 
 * @return uint8_t 
 */
uint8_t SMBus::i2c_read()
{
  uint8_t data = i2c->read();

  if (target_pec)
    __crc_write(data);

  return data;
}

/**
 * @brief write multiple bytes to the i2c bus and update the PEC
 * 
 * @param send_data_ptr buffer ptr with data to send
 * @param send_count the amount of bytes to send
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::i2c_write_bytes(uint8_t *send_data_ptr, uint8_t send_count)
{
  if (target_pec)
  {
    for (uint8_t i = 0; i < send_count; i++)
    {
      __crc_write(*(send_data_ptr + i));
    }
  }

  return (SMBUS_STATUS)i2c->write_bytes(send_data_ptr, send_count);
}

/**
 * @brief read multiple bytes from the i2c bus and update the PEC
 * 
 * @param recv_buffer_ptr buffer ptr to store received bytes
 * @param recv_count amount of bytes to receive
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::i2c_read_bytes(uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  auto res = (SMBUS_STATUS)i2c->read_bytes(recv_buffer_ptr, recv_count);

  if (target_pec)
  {
    for (uint8_t i = 0; i < recv_count; i++)
    {
      __crc_write(*(recv_buffer_ptr + i));
    }
  }
  return res;
}

// ---- (De)constructor ----

SMBus::SMBus(I2CDriver *i2c) : i2c{i2c}
{
}
SMBus::~SMBus()
{
}