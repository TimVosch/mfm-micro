#include "drivers/smbus.hpp"

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
  auto res = i2c.start(address, (I2C_RW)(command & 1));
  i2c.stop();
  return res;
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
  auto res = i2c.start(target, I2C_RW_WRITE, true);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = i2c.write(data);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = end();
  return res;
}

/**
 * @brief Receive a single byte from a device
 * 
 * @param response the byte read
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::receive_byte(uint8_t *response)
{
  auto res = i2c.start(target, I2C_RW_READ, true);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  i2c.read(response);

  res = end();
  return res;
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
  auto res = begin(target, command);

  res = i2c.write(data);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = end();
  return res;
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
  auto res = begin(target, command);

  res = i2c.restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  i2c.read(response);

  res = end();
  return res;
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

  return write_transaction(command, buffer, 2);
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

  auto res = read_transaction(command, buffer, 2);
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

  return write_transaction(command, buffer, sizeof(buffer));
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

  auto res = read_transaction(command, buffer, sizeof(buffer));
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

  return write_transaction(command, buffer, sizeof(buffer));
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

  auto res = read_transaction(command, buffer, sizeof(buffer));
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
  auto res = begin(target, command);

  res = i2c.write(buffer_size);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = i2c.write_bytes(buffer_ptr, buffer_size);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = end();
  return res;
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
  auto res = begin(target, command);

  i2c.restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  uint8_t block_size;
  i2c.read(&block_size);

  // Trying to receive more bytes than the buffer is long
  if (block_size > recv_buffer_size)
  {
    i2c.nack();
    i2c.stop();
    return SMBUS_STATUS_OVERFLOW;
  }
  i2c.ack();

  // TODO: always returns ACK...?
  i2c.read_bytes(recv_buffer_ptr, block_size);

  res = end();

  *recv_count = block_size;
  return res;
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

  auto res = i2c.start(target, I2C_RW_WRITE, true);
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  // Send command and word through using the buffer
  res = i2c.write_bytes(buffer, sizeof(buffer));
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  res = i2c.restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    return res;
  }

  // TODO: always returns ACK...?
  i2c.read_bytes(buffer, 2);

  res = end();

  // Build response
  *response = ((uint16_t)buffer[0]) | (buffer[1] << 8);

  return res;
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
  auto res = begin(target, command);

  // Write block

  res = i2c.write(send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = i2c.write_bytes(send_data_ptr, send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  // Read block
  res = i2c.restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  uint8_t block_size;
  i2c.read(&block_size);
  // Trying to receive more bytes than the buffer is long
  if (block_size > recv_buffer_size)
  {
    i2c.nack();
    i2c.stop();
    return SMBUS_STATUS_OVERFLOW;
  }
  i2c.ack();

  // TODO: always returns ACK...?
  i2c.read_bytes(recv_buffer_ptr, block_size);

  res = end();

  *recv_count = block_size;
  return res;
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
SMBUS_STATUS SMBus::write_transaction(uint8_t command, uint8_t *send_data_ptr, uint8_t send_count)
{
  auto res = begin(target, command);

  res = i2c.write_bytes(send_data_ptr, send_count);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = end();
  return res;
}

/**
 * @brief Send a command and receive an amount of bytes
 * 
 * @param command The command id
 * @param recv_buffer_ptr 
 * @param recv_count 
 * @return SMBUS_STATUS 
 */
SMBUS_STATUS SMBus::read_transaction(uint8_t command, uint8_t *recv_buffer_ptr, uint8_t recv_count)
{
  auto res = begin(target, command);

  i2c.restart(target, I2C_RW_READ);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  // TODO: always returns ACK...?
  i2c.read_bytes(recv_buffer_ptr, recv_count);

  res = end();
  return res;
}

SMBUS_STATUS SMBus::begin(uint8_t addr, uint8_t command)
{
  auto res = i2c.start(target, I2C_RW_WRITE, true);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  res = i2c.write(command);
  if (res != SMBUS_STATUS_OK)
  {
    i2c.stop();
    return res;
  }

  return res;
}

SMBUS_STATUS SMBus::end()
{
  auto res = SMBUS_STATUS_OK;

  // Resolve a pending read ack
  if (i2c.get_direction() == I2C_RW_READ && i2c.is_ack_pending())
  {
    // Expect PEC byte, so ack previous
    if (target_pec)
    {
      i2c.ack();
    }
    else
    {
      // No PEC byte will be sent, so previous byte was the last
      i2c.nack();
    }
  }

  // Append or verify PEC byte
  if (target_pec)
  {
    if (i2c.get_direction() == I2C_RW_WRITE)
    {
      res = i2c.write(i2c.get_pec());
    }
    else if (i2c.get_direction() == I2C_RW_READ)
    {
      uint8_t pec_secondary = i2c.get_pec();
      uint8_t pec_primary;
      i2c.read(&pec_primary);
      i2c.nack(); // Last byte we expect so nack

      if (pec_secondary != pec_primary)
      {
        res = SMBUS_STATUS_PEC_FAIL;
      }
    }
  }

  i2c.stop();
  return res;
}

// ---- (De)constructor ----

SMBus::SMBus(I2C_Master *i2c_driver) : i2c(i2c_driver)
{
}
SMBus::~SMBus()
{
}