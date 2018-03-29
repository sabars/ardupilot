
#ifndef __AP_HAL_BOARDS_H__
#define __AP_HAL_BOARDS_H__

/**
 * C preprocesor enumeration of the boards supported by the AP_HAL.
 * This list exists so HAL_BOARD == HAL_BOARD_xxx preprocessor blocks
 * can be used to exclude HAL boards from the build when appropriate.
 * Its not an elegant solution but we can improve it in future.
 */

#define HAL_BOARD_SITL     3
#define HAL_BOARD_QUAN     9
#define HAL_BOARD_EMPTY    99

// default board subtype is -1
#define HAL_BOARD_SUBTYPE_NONE -1

/**
   HAL Linux sub-types, starting at 1000
 */
#define HAL_BOARD_SUBTYPE_LINUX_NONE     1000
#define HAL_BOARD_SUBTYPE_LINUX_ERLEBOARD 1001
#define HAL_BOARD_SUBTYPE_LINUX_PXF      1002
#define HAL_BOARD_SUBTYPE_LINUX_NAVIO    1003
#define HAL_BOARD_SUBTYPE_LINUX_ZYNQ     1004
#define HAL_BOARD_SUBTYPE_LINUX_BBBMINI  1005
#define HAL_BOARD_SUBTYPE_LINUX_BEBOP    1006
#define HAL_BOARD_SUBTYPE_LINUX_RASPILOT 1007
#define HAL_BOARD_SUBTYPE_LINUX_MINLURE  1008
#define HAL_BOARD_SUBTYPE_LINUX_ERLEBRAIN2 1009

/**
   HAL PX4 sub-types, starting at 2000
 */
#define HAL_BOARD_SUBTYPE_PX4_V1         2000
#define HAL_BOARD_SUBTYPE_PX4_V2         2001

/**
   HAL VRBRAIN sub-types, starting at 4000
 */
#define HAL_BOARD_SUBTYPE_VRBRAIN_V45    4000
#define HAL_BOARD_SUBTYPE_VRBRAIN_V51    4001
#define HAL_BOARD_SUBTYPE_VRBRAIN_V52    4002
#define HAL_BOARD_SUBTYPE_VRUBRAIN_V51   4003
#define HAL_BOARD_SUBTYPE_VRUBRAIN_V52   4004

// InertialSensor driver types
#define HAL_INS_MPU60XX_SPI 2
#define HAL_INS_MPU60XX_I2C 3
#define HAL_INS_HIL     4
#define HAL_INS_PX4     5
#define HAL_INS_FLYMAPLE 6
#define HAL_INS_L3G4200D 7
#define HAL_INS_VRBRAIN  8
#define HAL_INS_MPU9250  9
#define HAL_INS_L3GD20   10
#define HAL_INS_LSM9DS0 11
#define HAL_INS_RASPILOT 12
#define HAL_INS_MPU9250_I2C 13
#define HAL_INS_QUAN 17


// barometer driver types
#define HAL_BARO_BMP085     1
#define HAL_BARO_MS5611     2
#define HAL_BARO_MS5611_SPI 3
#define HAL_BARO_MS5607     4
#define HAL_BARO_PX4        5
#define HAL_BARO_HIL        6
#define HAL_BARO_VRBRAIN    7
#define HAL_BARO_MS5637_I2C 8
#define HAL_BARO_QUAN       11


// compass driver types
#define HAL_COMPASS_HMC5843   1
#define HAL_COMPASS_PX4       2
#define HAL_COMPASS_HIL       3
#define HAL_COMPASS_VRBRAIN   4
#define HAL_COMPASS_AK8963_MPU9250 5
#define HAL_COMPASS_AK8963_I2C  6
#define HAL_COMPASS_HMC5843_MPU6000 7
#define HAL_COMPASS_RASPILOT  8

#define HAL_COMPASS_AK8963_MPU9250_I2C  9
#define HAL_COMPASS_QUAN      11
// Heat Types
#define HAL_LINUX_HEAT_PWM 1

/**
   operating system features:

   HAL implementations may define the following extra feature defines
   to 1 if available

  HAL_OS_POSIX_IO    :  has posix-like filesystem IO
  HAL_OS_SOCKETS     :  has posix-like sockets
 */

#if CONFIG_HAL_BOARD == HAL_BOARD_SITL
#define HAL_BOARD_NAME "SITL"
#define HAL_CPU_CLASS HAL_CPU_CLASS_1000
#define HAL_OS_POSIX_IO 1
#define HAL_OS_SOCKETS 1
#define HAL_STORAGE_SIZE            16384
#define HAL_STORAGE_SIZE_AVAILABLE  HAL_STORAGE_SIZE
#define HAL_BOARD_LOG_DIRECTORY "logs"
#define HAL_BOARD_TERRAIN_DIRECTORY "terrain"
#define HAL_PARAM_DEFAULTS_PATH "etc/defaults.parm"
#define HAL_INS_DEFAULT HAL_INS_HIL
#define HAL_BARO_DEFAULT HAL_BARO_HIL
#define HAL_COMPASS_DEFAULT HAL_COMPASS_HIL
namespace HALSITL {
   struct tag_board;
}

namespace AP_HAL{
   typedef HALSITL::tag_board board;
}

#elif CONFIG_HAL_BOARD == HAL_BOARD_QUAN
#define AP_HAL_BOARD_DRIVER AP_HAL_Quan
#define HAL_BOARD_NAME "QUAN"
// NB This causes issues since if its class 150 then code always assumes PX4
// 
#define HAL_CPU_CLASS HAL_CPU_CLASS_150
#define HAL_STORAGE_SIZE            4096
#define HAL_STORAGE_SIZE_AVAILABLE  HAL_STORAGE_SIZE
#define HAL_INS_DEFAULT HAL_INS_QUAN
#define HAL_BARO_DEFAULT HAL_BARO_QUAN
#define HAL_COMPASS_DEFAULT HAL_COMPASS_QUAN
#define CONFIG_HAL_BOARD_SUBTYPE HAL_BOARD_SUBTYPE_NONE
namespace Quan {
   struct tag_board;
}

namespace AP_HAL{
   typedef Quan::tag_board board;
}
#else
#error "Unknown CONFIG_HAL_BOARD type"
#endif

#ifndef CONFIG_HAL_BOARD_SUBTYPE
#error "No CONFIG_HAL_BOARD_SUBTYPE set"
#endif

#endif // __AP_HAL_BOARDS_H__
