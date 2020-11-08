#include "main.hpp"
#include "drivers/i2c_timing.hpp"
#include "drivers/i2c.hpp"
#include "drivers/smbus.hpp"

void gpio_init()
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

  // ---- Initialize I2C GPIO pins ----
  // Init SCL to OpenDrain
  GPIO_InitTypeDef scl_init = {0};
  scl_init.Pin = I2C_SCL_Pin;
  scl_init.Mode = GPIO_MODE_OUTPUT_OD;
  scl_init.Speed = GPIO_SPEED_FAST;
  scl_init.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(I2C_SCL_Port, &scl_init);

  // Init SDA to OpenDrain
  GPIO_InitTypeDef sda_init = {0};
  sda_init.Pin = I2C_SDA_Pin;
  sda_init.Mode = GPIO_MODE_OUTPUT_OD;
  sda_init.Speed = GPIO_SPEED_FAST;
  sda_init.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(I2C_SDA_Port, &sda_init);

  // Default high
  HAL_GPIO_WritePin(I2C_SDA_Port, I2C_SDA_Pin, GPIO_PIN_SET);
  HAL_GPIO_WritePin(I2C_SCL_Port, I2C_SCL_Pin, GPIO_PIN_SET);
}

void crc_init()
{
  __HAL_RCC_CRC_CLK_ENABLE();
}

void timer_init()
{
  // Set TIMER 6 to us
  uint8_t psc = SystemCoreClock / 1e6 - 1;
  __HAL_RCC_TIM6_CLK_ENABLE();
  TIM6->SR = 0;
  TIM6->PSC = psc;
  TIM6->CR1 = TIM_CR1_UDIS;
  TIM6->CR1 = TIM_CR1_CEN;
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_OFF;
  RCC_OscInitStruct.MSIState = RCC_MSI_OFF;
  RCC_OscInitStruct.HSICalibrationValue = 0;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSE;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
  SystemCoreClockUpdate();
}

int main(void)
{
  SystemClock_Config();
  HAL_Init();
  gpio_init();
  timer_init();
  crc_init();

  I2C_TIMING standard = I2C_TIMING_STANDARD;
  I2CDriver i2c(I2C_SCL_Pin, I2C_SCL_Port, I2C_SDA_Pin, I2C_SDA_Port, &standard);
  SMBus smbus(&i2c);

  smbus.select(0x70);
  for (;;)
  {
    uint8_t data;
    auto res = smbus.receive_byte(&data);
    if (res == SMBUS_STATUS_PEC_FAIL)
    {
      HAL_GPIO_TogglePin(LED0_Port, LED0_Pin);
    }

    HAL_Delay(1000);
  }
}

void Error_Handler(void)
{
  for (;;)
    ;
}