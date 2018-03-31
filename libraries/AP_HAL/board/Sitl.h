#ifndef ARDUPILOT_LIBRARIES_AP_HAL_BOARDS_SITL_H_INCLUDED
#define ARDUPILOT_LIBRARIES_AP_HAL_BOARDS_SITL_H_INCLUDED

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


#endif // ARDUPILOT_LIBRARIES_AP_HAL_BOARDS_SITL_H_INCLUDED
