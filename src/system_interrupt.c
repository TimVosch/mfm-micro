#include "stm32l0xx_it.h"

void NMI_Handler(void)
{
}

void HardFault_Handler(void)
{
  for (;;)
    ;
}

void SVC_Handler(void)
{
}

void PendSV_Handler(void)
{
}

void SysTick_Handler(void)
{
  HAL_IncTick();
}
