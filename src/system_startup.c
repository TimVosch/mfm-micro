#include <stdint.h>
#include <stm32l0xx_hal.h>
#define _estack 0x20005000
#define weak_alias(old, new) \
  extern __typeof(old) new __attribute__((weak, alias(#old)))

extern unsigned int _sidata;
extern unsigned int _sdata;
extern unsigned int _edata;
extern unsigned int _sbss;
extern unsigned int _ebss;

void Reset_Handler();
void Default_Handler();
void SystemInit();
void __libc_init_array();
void main();

weak_alias(Default_Handler, NMI_Handler);
weak_alias(Default_Handler, HardFault_Handler);
weak_alias(Default_Handler, SVC_Handler);
weak_alias(Default_Handler, PendSV_Handler);
weak_alias(Default_Handler, SysTick_Handler);
weak_alias(Default_Handler, WWDG_IRQHandler);
weak_alias(Default_Handler, PVD_IRQHandler);
weak_alias(Default_Handler, RTC_IRQHandler);
weak_alias(Default_Handler, FLASH_IRQHandler);
weak_alias(Default_Handler, RCC_CRS_IRQHandler);
weak_alias(Default_Handler, EXTI0_1_IRQHandler);
weak_alias(Default_Handler, EXTI2_3_IRQHandler);
weak_alias(Default_Handler, EXTI4_15_IRQHandler);
weak_alias(Default_Handler, TSC_IRQHandler);
weak_alias(Default_Handler, DMA1_Channel1_IRQHandler);
weak_alias(Default_Handler, DMA1_Channel2_3_IRQHandler);
weak_alias(Default_Handler, DMA1_Channel4_5_6_7_IRQHandler);
weak_alias(Default_Handler, ADC1_COMP_IRQHandler);
weak_alias(Default_Handler, LPTIM1_IRQHandler);
weak_alias(Default_Handler, USART4_5_IRQHandler);
weak_alias(Default_Handler, TIM2_IRQHandler);
weak_alias(Default_Handler, TIM3_IRQHandler);
weak_alias(Default_Handler, TIM6_DAC_IRQHandler);
weak_alias(Default_Handler, TIM7_IRQHandler);
weak_alias(Default_Handler, TIM21_IRQHandler);
weak_alias(Default_Handler, I2C3_IRQHandler);
weak_alias(Default_Handler, TIM22_IRQHandler);
weak_alias(Default_Handler, I2C1_IRQHandler);
weak_alias(Default_Handler, I2C2_IRQHandler);
weak_alias(Default_Handler, SPI1_IRQHandler);
weak_alias(Default_Handler, SPI2_IRQHandler);
weak_alias(Default_Handler, USART1_IRQHandler);
weak_alias(Default_Handler, USART2_IRQHandler);
weak_alias(Default_Handler, RNG_LPUART1_IRQHandler);
weak_alias(Default_Handler, USB_IRQHandler);

unsigned int *vectorTable[48] __attribute__((section(".isr_vector"))) = {
    (unsigned int *)_estack,
    (unsigned int *)Reset_Handler,
    (unsigned int *)NMI_Handler,
    (unsigned int *)HardFault_Handler,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)SVC_Handler,
    (unsigned int *)0,
    (unsigned int *)0,
    (unsigned int *)PendSV_Handler,
    (unsigned int *)SysTick_Handler,
    (unsigned int *)WWDG_IRQHandler,                /* Window WatchDog              */
    (unsigned int *)PVD_IRQHandler,                 /* PVD through EXTI Line detection */
    (unsigned int *)RTC_IRQHandler,                 /* RTC through the EXTI line     */
    (unsigned int *)FLASH_IRQHandler,               /* FLASH                        */
    (unsigned int *)RCC_CRS_IRQHandler,             /* RCC and CRS                  */
    (unsigned int *)EXTI0_1_IRQHandler,             /* EXTI Line 0 and 1            */
    (unsigned int *)EXTI2_3_IRQHandler,             /* EXTI Line 2 and 3            */
    (unsigned int *)EXTI4_15_IRQHandler,            /* EXTI Line 4 to 15            */
    (unsigned int *)TSC_IRQHandler,                 /* TSC                           */
    (unsigned int *)DMA1_Channel1_IRQHandler,       /* DMA1 Channel 1               */
    (unsigned int *)DMA1_Channel2_3_IRQHandler,     /* DMA1 Channel 2 and Channel 3 */
    (unsigned int *)DMA1_Channel4_5_6_7_IRQHandler, /* DMA1 Channel 4, Channel 5, Channel 6 and Channel 7*/
    (unsigned int *)ADC1_COMP_IRQHandler,           /* ADC1, COMP1 and COMP2        */
    (unsigned int *)LPTIM1_IRQHandler,              /* LPTIM1                       */
    (unsigned int *)USART4_5_IRQHandler,            /* USART4 and USART 5           */
    (unsigned int *)TIM2_IRQHandler,                /* TIM2                         */
    (unsigned int *)TIM3_IRQHandler,                /* TIM3                         */
    (unsigned int *)TIM6_DAC_IRQHandler,            /* TIM6 and DAC                 */
    (unsigned int *)TIM7_IRQHandler,                /* TIM7                         */
    (unsigned int *)0,                              /* Reserved                     */
    (unsigned int *)TIM21_IRQHandler,               /* TIM21                        */
    (unsigned int *)I2C3_IRQHandler,                /* I2C3                         */
    (unsigned int *)TIM22_IRQHandler,               /* TIM22                        */
    (unsigned int *)I2C1_IRQHandler,                /* I2C1                         */
    (unsigned int *)I2C2_IRQHandler,                /* I2C2                         */
    (unsigned int *)SPI1_IRQHandler,                /* SPI1                         */
    (unsigned int *)SPI2_IRQHandler,                /* SPI2                         */
    (unsigned int *)USART1_IRQHandler,              /* USART1                       */
    (unsigned int *)USART2_IRQHandler,              /* USART2                       */
    (unsigned int *)RNG_LPUART1_IRQHandler,         /* RNG and LPUART1              */
    (unsigned int *)0,                              /* Reserved                     */
    (unsigned int *)USB_IRQHandler,                 /* USB                          */
};

void Default_Handler()
{
  for (;;)
    ;
}

typedef void pFunc(void);
void Reset_Handler()
{
  unsigned int *data_rom_start_p = &_sidata;
  unsigned int *data_ram_start_p = &_sdata;
  unsigned int *data_ram_end_p = &_edata;

  unsigned int *_bss_start_p = &_sbss;
  unsigned int *_bss_end_p = &_ebss;

/*
  This code allows a STM32 MCU to go into the bootloader,
  without using the BOOT0 pin and simply tapping RST twice.

  Unfortunately this does not work on the STM32L0/1 according
  to appendix SN2602 which clarifies that the "not-empty" check
  in these MCUs causes the bootloader to skip to user flash 
  if the first 4 bytes of the user flash space is populated.

  The code is left here because it may already work for other
  STM32 MCUs
*/
#ifdef BOOTLOADER
  // Check if reset is set in EEPROM
  uint32_t boot_magic = 0x4E525354;
  uint32_t *boot_magic_ptr = (uint32_t *)(&_ebss - 4);
  uint32_t *boot_vector = (uint32_t *)0x1FF00000;
  uint32_t boot_sp = *boot_vector;
  uint32_t *boot_reset = (uint32_t *)(*(boot_vector + 0x4));

  // If boot magic is present then boot to bootloader
  if (*boot_magic_ptr == boot_magic)
  {
    *boot_magic_ptr = 0x00000000;
    // Jump to bootloader reset handler
    pFunc *JumpBootloader = (void (*)(void))(boot_reset);

    HAL_RCC_DeInit();

    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;

    __disable_irq();

    __set_MSP(boot_sp);
    // Map system memory at 0x0000 0000
    SYSCFG->CFGR1 = 0x1;
    JumpBootloader();

    // Should never be reached
    for (;;)
      ;
  }
  else
  {
    // Boot magic was not present so set it
    *boot_magic_ptr = boot_magic;

    // Delay startup so the user can press the rst again
    for (unsigned int x = 0; x < 100000; x++)
    {
      asm("nop");
    }
  }
#endif

  // Copy .data from ROM to RAM
  while (data_ram_start_p != data_ram_end_p)
  {
    *data_ram_start_p = *data_rom_start_p;
    data_ram_start_p++;
    data_rom_start_p++;
  }

  // Initialize .bss with nulls
  while (_bss_start_p != _bss_end_p)
  {
    *_bss_start_p = 0;
    _bss_start_p++;
  }

  SystemInit();
  __libc_init_array();
  main();
}