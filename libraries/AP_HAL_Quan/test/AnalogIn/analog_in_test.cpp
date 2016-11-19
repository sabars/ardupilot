
#include <AP_HAL/AP_HAL.h>
#if CONFIG_HAL_BOARD == HAL_BOARD_QUAN

#include <AP_Common/AP_Common.h>
#include <AP_Progmem/AP_Progmem.h>
#include <AP_Param/AP_Param.h>
#include <StorageManager/StorageManager.h>
#include <AP_Math/AP_Math.h>
#include <AP_HAL_Quan/AP_HAL_Quan.h>
#include <AP_HAL_Quan/AP_HAL_Quan_Test_Main.h>
#include <AP_HAL/utility/functor.h>

#include <quantracker/osd/osd.hpp>
#include <task.h>
#include <cstring>
#include <stm32f4xx.h>

const AP_HAL::HAL& hal = AP_HAL::get_HAL();

namespace {

   constexpr uint8_t red_led_pin = 1U;
   constexpr uint8_t test_pin = 2U;

   constexpr uint8_t pin_off = 0U;
   constexpr uint8_t pin_on = 1U;

   constexpr uint8_t num_adc_channels = 5U;

   struct test_task_t{

      test_task_t(): m_count{0}{}

      void fun()
      {
          if (++m_count == 500){
              m_count = 0;
          
              uint32_t flags =  DMA2->HISR;
              if( flags & (1 << 0)){
                  hal.console->printf("Stream X fifo error\n");
              }
              if (flags & (1<<2)){
                  hal.console->printf("direct mode error\n");
              }
              if (flags & (1<<3)){
                  hal.console->printf("stream transfer error\n");
              }
              if (flags & (1<<4)){
                  hal.console->printf("half transfer interrupt\n");
              }
              if (flags & (1<<4)){
                  hal.console->printf("transfer complete interrupt\n");
              }
//              uint32_t ndtr = DMA2_Stream4->NDTR;
//                   hal.console->printf("ndtr = %d\n", static_cast<int>(ndtr));
           
              uint32_t adc_flags = ADC1->SR;
              if (adc_flags & (1<<5)){
                  hal.console->printf("adc overrun\n");
              }
              if (adc_flags & (1<<1)){
                  hal.console->printf("adc eoc\n");
              }
              if (adc_flags & (1<<4)){
                  hal.console->printf("adc start\n");
              }

             // uint32_t voltage = ADC1->DR;
             // hal.console->printf("adc result =%d\n",static_cast<int>(voltage));
               for ( int i = 0; i < num_adc_channels; ++i){
                float voltage = hal.analogin->channel(i)->voltage_average();
                if ( i == 3){ // battery
                   constexpr float scale = 4.29541951026795;
                   hal.console->printf("battery voltage = %f V\n",static_cast<double>(voltage * scale));
                }else{
                  hal.console->printf("voltage[%d] = %f V\n",i,static_cast<double>(voltage));
                }
               }
            //hal.gpio->toggle(red_led_pin);
          }
      };

      void init()
      {
          hal.gpio->pinMode(red_led_pin,HAL_GPIO_OUTPUT);
          hal.gpio->write(red_led_pin,pin_off);
      }
   private:
      uint32_t m_count ;
   } test_task;

}

// called once after init of hal before startup of apm task
void setup() 
{
 	hal.console->printf("Quan APM Analogin test\n");
   test_task.init();
}

void on_telemetry_transmitted()
{
}

void quan::uav::osd::on_draw() 
{ 
   draw_text("Quan APM AnalogIn test",{-140,50});
}

namespace {

   TickType_t prev_wake_time= 0; 
   uint32_t led_count = 0;

}
// called forever in apm_task
void loop() 
{
   vTaskDelayUntil(&prev_wake_time,1); 
   test_task.fun();
   if ( ++led_count == 200){
      led_count = 0;
      hal.gpio->toggle(test_pin);
   }
}

namespace {
   uint32_t get_flags()
   {
      HAL_Quan::start_flags flags{0};
      flags.init_uartA = true;
      flags.init_analogin = true;
      flags.init_gpio = true;
      flags.init_scheduler = true;
      return flags.value;
   }
}

AP_HAL_TEST_MAIN( get_flags() )

#endif