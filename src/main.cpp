#include "main.h"

int main(void)
{
  HAL_Init();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  GPIO_InitTypeDef GPIO_LED = {0};
  GPIO_LED.Pin = LED0_Pin;
  GPIO_LED.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_LED.Speed = GPIO_SPEED_FAST;
  GPIO_LED.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(LED0_GPIO_Port, &GPIO_LED);

  for (;;)
  {
    HAL_GPIO_TogglePin(LED0_GPIO_Port, LED0_Pin);
    HAL_Delay(500);
  }
}