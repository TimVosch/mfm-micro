#include "main.h"

SPI_HandleTypeDef SPI = {0};

uint8_t SPI_LED_ON[] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
uint8_t SPI_LED_OFF[] = {0xDE, 0xAD, 0xBE, 0xEF};

void initGPIO()
{
  // Enable GPIO CLK
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  GPIO_InitTypeDef GPIO_LED = {0};
  GPIO_LED.Pin = LED0_Pin;
  GPIO_LED.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_LED.Speed = GPIO_SPEED_FAST;
  GPIO_LED.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(LED0_Port, &GPIO_LED);

  // Initialize GPIO ports for SPI
  GPIO_InitTypeDef GPIO_SPI = {0};
  GPIO_SPI.Pin = PERIPHERAL_SCK_Pin | PERIPHERAL_MISO_Pin | PERIPHERAL_MOSI_Pin;
  GPIO_SPI.Alternate = PERIPHERAL_SPI_AF;
  GPIO_SPI.Mode = GPIO_MODE_AF_PP;
  GPIO_SPI.Speed = GPIO_SPEED_HIGH;
  GPIO_SPI.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(PERIPHERAL_SPI_Port, &GPIO_SPI);
}

void initSPI()
{
  // Enable SPI CLK
  __HAL_RCC_SPI1_CLK_ENABLE();

  // Initialize the SPI struct
  SPI.Instance = PERIPHERAL_SPI_Instance;
  SPI.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_256;
  SPI.Init.Direction = SPI_DIRECTION_2LINES;
  SPI.Init.CLKPhase = SPI_PHASE_2EDGE;
  SPI.Init.CLKPolarity = SPI_POLARITY_HIGH;
  SPI.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLED;
  SPI.Init.DataSize = SPI_DATASIZE_8BIT;
  SPI.Init.FirstBit = SPI_FIRSTBIT_LSB;
  SPI.Init.NSS = SPI_NSS_SOFT;
  SPI.Init.TIMode = SPI_TIMODE_DISABLED;
  SPI.Init.Mode = SPI_MODE_MASTER;

  if (HAL_SPI_Init(&SPI) != HAL_OK)
  {
    for (;;)
    {
      HAL_GPIO_TogglePin(LED0_Port, LED0_Pin);
      HAL_Delay(100);
    }
  }
}

void initNSS()
{
  GPIO_InitTypeDef GPIO_nss = {0};
  GPIO_nss.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_nss.Pull = GPIO_PULLUP;
  GPIO_nss.Pin = PERIPHERAL1_NSS_Pin;
  GPIO_nss.Speed = GPIO_SPEED_FAST;
  HAL_GPIO_Init(PERIPHERAL1_NSS_Port, &GPIO_nss);
}

int main(void)
{
  HAL_Init();

  initGPIO();
  initNSS();
  initSPI();

  for (;;)
  {
    HAL_GPIO_WritePin(PERIPHERAL1_NSS_Port, PERIPHERAL1_NSS_Pin, GPIO_PIN_RESET);
    HAL_SPI_Transmit(&SPI, &SPI_LED_ON[0], sizeof(SPI_LED_ON), 500);
    HAL_GPIO_WritePin(PERIPHERAL1_NSS_Port, PERIPHERAL1_NSS_Pin, GPIO_PIN_SET);

    HAL_GPIO_WritePin(LED0_Port, LED0_Pin, GPIO_PIN_SET);

    HAL_Delay(500);

    HAL_GPIO_WritePin(PERIPHERAL1_NSS_Port, PERIPHERAL1_NSS_Pin, GPIO_PIN_RESET);
    HAL_SPI_Transmit(&SPI, &SPI_LED_OFF[0], sizeof(SPI_LED_OFF), 500);
    HAL_GPIO_WritePin(PERIPHERAL1_NSS_Port, PERIPHERAL1_NSS_Pin, GPIO_PIN_SET);

    HAL_GPIO_WritePin(LED0_Port, LED0_Pin, GPIO_PIN_RESET);

    HAL_Delay(500);
  }
}