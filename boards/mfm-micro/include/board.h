#if !defined(_BOARD_H_)
#define _BOARD_H_

#include <stm32l0xx_hal.h>
#include <stm32l0xx_hal_gpio.h>

/*
  Pin definitions
*/

#define LED0_Pin GPIO_PIN_3
#define LED0_Port GPIOB

/*
  Peripheral I2C definitions
*/

#define I2C_SCL_Port GPIOA
#define I2C_SCL_Pin GPIO_PIN_5
#define I2C_SDA_Port GPIOA
#define I2C_SDA_Pin GPIO_PIN_6

/*
  Peripheral SPI definitions
*/

// #define PERIPHERAL_SPI_AF GPIO_AF0_SPI1
// #define PERIPHERAL_SPI_Instance SPI1
// #define PERIPHERAL_SPI_Port GPIOA

// #define PERIPHERAL_SCK_Pin GPIO_PIN_5
// #define PERIPHERAL_MISO_Pin GPIO_PIN_6
// #define PERIPHERAL_MOSI_Pin GPIO_PIN_7

// #define PERIPHERAL_INT_Pin GPIO_PIN_13
// #define PERIPHERAL_INT_Port GPIOB

// #define PERIPHERAL1_NSS_Pin GPIO_PIN_0
// #define PERIPHERAL1_NSS_Port GPIOB

// #define PERIPHERAL2_NSS_Pin GPIO_PIN_1
// #define PERIPHERAL2_NSS_Port GPIOB

#endif