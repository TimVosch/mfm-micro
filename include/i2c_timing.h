#if !defined(_I2C_TIMING_H_)
#define _I2C_TIMING_H_

#include <stdint.h>

/**
 * I2C timings in microseconds (us)
 */
typedef struct
{
  uint8_t bus_free;           // Time between a STOP (on rising SDA) and START (on falling SDA) command
  uint8_t start_hold;         // Time between falling SDA and falling SCL
  uint8_t start_repeat_setup; // Time between last rising SCL and falling SCL
  uint8_t stop_setup;         // Time between rising SCL and rising SDA
  uint8_t low_period;         // Time between falling SCL and rising SCL
  uint8_t high_period;        // Time between rising SCl and falling SCL
  uint8_t data_hold;          // Time between falling SCL and changing SDA
  uint8_t data_setup;         // Time between changing SDA and rising SCL
  uint8_t clock_stretch;      // Maximum time that a slave can stretch the clock
} I2C_TIMING;

#define I2C_TIMING_STANDARD {.bus_free = 5,           \
                             .start_hold = 4,         \
                             .start_repeat_setup = 5, \
                             .stop_setup = 4,         \
                             .low_period = 5,         \
                             .high_period = 4,        \
                             .data_hold = 0,          \
                             .data_setup = 1,         \
                             .clock_stretch = 100};

#endif // _I2C_TIMING_H_