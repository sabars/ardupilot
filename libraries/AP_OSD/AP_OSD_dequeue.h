#ifndef AP_OSD_DEQUEUE_H_INCLUDED
#define AP_OSD_DEQUEUE_H_INCLUDED

//#include <AP_GPS/AP_GPS.h>
#include "AP_OSD.h"
#include "AP_OSD_enqueue.h"
#include <quan/three_d/vect.hpp>
#include <quan/angle.hpp>
#include <quan/uav/osd/api.hpp>
#include <quan/uav/position.hpp>
#include <quan/velocity.hpp>
#include <quan/voltage.hpp>
#include <quan/current.hpp>
#include <quan/charge.hpp>

namespace AP_OSD { namespace dequeue{

   // The data structure to be read by the OSD
   struct osd_info_t{
      osd_info_t()
      : system_status{AP_OSD:system_status_t::starting}
      , rc_in_channels
            {0,0,0,0,0,0,
               0,0,0,0,0,0,
                  0,0,0,0,0,0}
      ,gps_status{0} // no gps
      ,gps_num_sats{0}
      ,home_is_set{false}
      ,control_mode{16} // initialising
      {
      }

      quan::uav::osd::attitude_type       attitude;  
      quan::uav::osd::position_type       aircraft_position; 
      quan::uav::osd::position_type       home_position; 
      quan::length_<float>::m             distance_from_home;
      quan::angle_<float>::deg            bearing_to_home;

      quan::velocity_<float>::m_per_s     airspeed; 
      quan::voltage::V                    battery_voltage; 
      quan::current::A                    battery_current; 
      quan::charge::mA_h                  battery_mAh_consumed; 
      AP_OSD::system_status_t             system_status; 
     
      uint16_t                            rc_in_channels[18];
      uint8_t                             gps_status; // enum as per AP_GPS.h
      uint8_t                             gps_num_sats;
      quan::velocity_<float>::m_per_s     ground_speed;
      quan::angle_<float>::deg            ground_course;
      bool                                home_is_set;
      uint8_t                             control_mode;
   };

   void read_stream(osd_info_t& info);
   void update(osd_info_t& info);

}}

#endif // AP_OSD_DEQUEUE_H_INCLUDED