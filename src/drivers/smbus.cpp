#include "drivers/smbus.hpp"

// ---- Odd ones ----
/**
 * @brief Trigger a device
 * 
 * @param address the device address
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::quick_command(uint8_t address)
{
  // Read Write bit is unused in this command
  auto res = i2c->start(address, I2C_RW_WRITE);
  i2c->stop();
  return (SMBUS_STATUS)res;
}

/**
 * @brief Trigger a device
 * 
 * @param address the device address
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::quick_command()
{
  return quick_command(target);
}

/**
 * @brief write a single byte to a device
 * 
 * @param data byte to write
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::send_byte(uint8_t data)
{
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  i2c->write(data);

  i2c->stop();
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
  auto res = i2c->start(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  *response = i2c->read();
  i2c->ack();

  i2c->stop();
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(data);
  if (res != I2C_RESPONSE_ACK)
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->restart(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  *response = i2c->read();
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(buffer_size);
  if (res != I2C_RESPONSE_ACK)
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  i2c->restart(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  uint8_t block_size = i2c->read();
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
  uint8_t buffer[3] = {
      command,
      (uint8_t)data,
      (uint8_t)(data >> 8),
  };

  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    return (SMBUS_STATUS)res;
  }

  // Send command and word through using the buffer
  res = i2c_write_bytes(buffer, sizeof(buffer));
  if (res != I2C_RESPONSE_ACK)
  {
    return (SMBUS_STATUS)res;
  }

  res = i2c->restart(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  // Write block

  res = i2c->write(send_count);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write_bytes(send_data_ptr, send_count);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  // Read block
  res = i2c->restart(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  uint8_t block_size = i2c->read();
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
 * @brief write multiple bytes
 * 
 * @param send_data_ptr buffer ptr with data to send
 * @param send_count 
 * @return SMBUS_STATUS 
 */
I2C_RESPONSE SMBus::i2c_write_bytes(uint8_t *send_data_ptr, uint8_t send_count)
{
  I2C_RESPONSE res;
  for (uint8_t i = 0; i < send_count; i++)
  {
    res = i2c->write(*send_data_ptr++);
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
 * @return SMBUS_STATUS 
 */
I2C_RESPONSE SMBus::i2c_read_bytes(uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  for (uint8_t i = 0; i < recv_count; i++)
  {
    *(recv_buffer_ptr++) = i2c->read();

    // Let the caller decide whether to (n)ack the last byte
    if (i < recv_count - 1)
    {
      i2c->ack();
    }
  }

  return I2C_RESPONSE_ACK;
}

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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c_write_bytes(send_data_ptr, send_count);

  i2c->stop();
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
  auto res = i2c->start(target, I2C_RW_WRITE);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  res = i2c->write(command);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  i2c->restart(target, I2C_RW_READ);
  if (res != I2C_RESPONSE_ACK)
  {
    i2c->stop();
    return (SMBUS_STATUS)res;
  }

  // TODO: always returns ACK...?
  i2c_read_bytes(recv_buffer_ptr, recv_count);
  i2c->nack();

  i2c->stop();
  return (SMBUS_STATUS)res;
}

// ---- (De)constructor ----

SMBus::SMBus(I2CDriver *i2c) : i2c{i2c}
{
}
SMBus::~SMBus()
{
}