#if !defined(_SMBUS_STATUS_H_)
#define _SMBUS_STATUS_H_

typedef enum
{
  SMBUS_STATUS_OK,   // Same as I2C_ACK
  SMBUS_STATUS_NACK, // Same as I2C_NACK
  SMBUS_STATUS_LOST_ARBITRATION,
  SMBUS_STATUS_PEC_FAIL,
  SMBUS_STATUS_OVERFLOW,
} SMBUS_STATUS;

#endif // _SMBUS_STATUS_H_