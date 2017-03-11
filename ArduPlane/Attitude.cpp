// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifdef min
#undef  min
#endif
#include "Plane.h"

/*
  get a speed scaling number for control surfaces. This is applied to
  PIDs to change the scaling of the PID with speed. At high speed we
  move the surfaces less, and at low speeds we move them more.
  The return value hovers somewhere around 1.0f
 */
float Plane::get_speed_scaler(void)
{
    float aspeed, speed_scaler;
    if (ahrs.airspeed_estimate(&aspeed)) {
        if (aspeed > auto_state.highest_airspeed) {
            auto_state.highest_airspeed = aspeed;
        }
        if (aspeed > 0) {
            speed_scaler = g.scaling_speed / aspeed;
        } else {
            speed_scaler = 2.0;
        }
        speed_scaler = constrain_float(speed_scaler, 0.5f, 2.0f);
    } else {
        if (channel_throttle.get_servo_out() > 0) {
            // THROTTLE_CRUISE is a percentage between 0 - to 100
            speed_scaler = 0.5f + ((float)THROTTLE_CRUISE / channel_throttle.get_servo_out() / 2.0f); 
            // First order taylor expansion of square root
            // Should maybe be to the 2/7 power, but we aren't goint to implement that...
        }else{
            speed_scaler = 1.67f;
        }
        // This case is constrained tighter as we don't have real speed info
        speed_scaler = constrain_float(speed_scaler, 0.6f, 1.67f);
    }
    return speed_scaler;
}

/*
  return true if the current settings and mode should allow for stick mixing
 */
bool Plane::stick_mixing_enabled(void)
{
    if (auto_throttle_mode) {
        // we're in an auto mode. Check the stick mixing flag
        if (g.stick_mixing != STICK_MIXING_DISABLED &&
            geofence_stickmixing() &&
            failsafe.state == FAILSAFE_NONE &&
            !failsafe_state_detected()) {
            // we're in an auto mode, and haven't triggered failsafe
            return true;
        } else {
            return false;
        }
    }

    if (failsafe.ch3_failsafe && g.short_fs_action == 2) {
        // don't do stick mixing in FBWA glide mode
        return false;
    }

    // non-auto mode. Always do stick mixing
    return true;
}


/*
  this is the main roll stabilization function. It takes the
  previously set nav_roll calculates roll servo_out to try to
  stabilize the plane at the given roll
 */
void Plane::stabilize_roll(float speed_scaler)
{

    bool disable_integrator = false;
    if (control_mode == STABILIZE && channel_roll.get_control_in() != 0) {
        disable_integrator = true;
    }
    channel_roll.set_servo_out( rollController.get_servo_out(nav_roll_cd - ahrs.roll_sensor, 
                                                           speed_scaler, 
                                                           disable_integrator) );
}

/*
  this is the main pitch stabilization function. It takes the
  previously set nav_pitch and calculates servo_out values to try to
  stabilize the plane at the given attitude.
 */
void Plane::stabilize_pitch(float speed_scaler)
{
    int8_t const force_elevator = takeoff_tail_hold();
    if (force_elevator != 0) {
        // we are holding the tail down during takeoff. Just covert
        // from a percentage to a -4500..4500 centidegree angle
        channel_pitch.set_servo_out( 45*force_elevator);
        return;
    }
    int32_t demanded_pitch = nav_pitch_cd + g.pitch_trim_cd + channel_throttle.get_servo_out() * g.kff_throttle_to_pitch;
    bool disable_integrator = false;
    if (control_mode == STABILIZE && channel_pitch.get_control_in() != 0) {
        disable_integrator = true;
    }
    channel_pitch.set_servo_out (pitchController.get_servo_out(demanded_pitch - ahrs.pitch_sensor, 
                                                             speed_scaler, 
                                                             disable_integrator) );
}

namespace {

   // ouch o only for pitch and roll
   // servo_out has been set by ? and manual is mixed in
   void stick_mix_channel(RC_Channel &channel)
   {
      float const user_stick_move = quan::min(std::abs(channel.get_radio_in() - channel.get_radio_trim()),400);
      float const auto_influence = (400.f - user_stick_move)/400.f;
      int16_t servo_out = channel.get_servo_out() * auto_influence + channel.pwm_to_angle();
      channel.set_servo_out(servo_out);
   }
}

/*
  this gives the user control of the aircraft in stabilization modes
 */
void Plane::stabilize_stick_mixing_direct()
{
    if ( stick_mixing_enabled()  &&  
         !(
           control_mode == ACRO ||
           control_mode == FLY_BY_WIRE_A ||
           control_mode == AUTOTUNE ||
           control_mode == FLY_BY_WIRE_B ||
           control_mode == CRUISE ||
           control_mode == TRAINING
         )
    )
    {
      stick_mix_channel(channel_roll);
      stick_mix_channel(channel_pitch);
    }
}

/*
  this gives the user control of the aircraft in stabilization modes
  using FBW style controls
 */
void Plane::stabilize_stick_mixing_fbw()
{
    if (!stick_mixing_enabled() ||
        control_mode == ACRO ||
        control_mode == FLY_BY_WIRE_A ||
        control_mode == AUTOTUNE ||
        control_mode == FLY_BY_WIRE_B ||
        control_mode == CRUISE ||
        control_mode == TRAINING ||
        (control_mode == AUTO && g.auto_fbw_steer)) {
        return;
    }
    // do FBW style stick mixing. We don't treat it linearly
    // however. For inputs up to half the maximum, we use linear
    // addition to the nav_roll and nav_pitch. Above that it goes
    // non-linear and ends up as 2x the maximum, to ensure that
    // the user can direct the plane in any direction with stick
    // mixing.
    float roll_input = channel_roll.norm_input();
    if (roll_input > 0.5f) {
        roll_input = (3*roll_input - 1);
    } else if (roll_input < -0.5f) {
        roll_input = (3*roll_input + 1);
    }
    nav_roll_cd += roll_input * roll_limit_cd;
    nav_roll_cd = constrain_int32(nav_roll_cd, -roll_limit_cd, roll_limit_cd);
    
    float pitch_input = channel_pitch.norm_input();
    if (fabsf(pitch_input) > 0.5f) {
        pitch_input = (3*pitch_input - 1);
    }

    if (pitch_input > 0) {
        nav_pitch_cd += pitch_input * aparm.pitch_limit_max_cd;
    } else {
        nav_pitch_cd += -(pitch_input * pitch_limit_min_cd);
    }
    nav_pitch_cd = constrain_int32(nav_pitch_cd, pitch_limit_min_cd, aparm.pitch_limit_max_cd.get());
}

/*
  a special stabilization function for training mode
 */
void Plane::stabilize_training(float speed_scaler)
{
    if (training_manual_roll) {
        channel_roll.set_servo_out(channel_roll.get_control_in());
    } else {
        // calculate what is needed to hold
        stabilize_roll(speed_scaler);
        if ((nav_roll_cd > 0 && channel_roll.get_control_in() < channel_roll.get_servo_out()) ||
            (nav_roll_cd < 0 && channel_roll.get_control_in() > channel_roll.get_servo_out())) {
            // allow user to get out of the roll
            channel_roll.set_servo_out(channel_roll.get_control_in());            
        }
    }

    if (training_manual_pitch) {
        channel_pitch.set_servo_out(channel_pitch.get_control_in());
    } else {
        stabilize_pitch(speed_scaler);
        if ((nav_pitch_cd > 0 && channel_pitch.get_control_in() < channel_pitch.get_servo_out()) ||
            (nav_pitch_cd < 0 && channel_pitch.get_control_in() > channel_pitch.get_servo_out())) {
            // allow user to get back to level
            channel_pitch.set_servo_out(channel_pitch.get_control_in());            
        }
    }
}


/*
  this is the ACRO mode stabilization function. It does rate
  stabilization on roll and pitch axes
 */
void Plane::stabilize_acro(float speed_scaler)
{
    float roll_rate = (channel_roll.get_control_in()/4500.0f) * g.acro_roll_rate;
    float pitch_rate = (channel_pitch.get_control_in()/4500.0f) * g.acro_pitch_rate;

    /*
      check for special roll handling near the pitch poles
     */
    if (g.acro_locking && is_zero(roll_rate)) {
        /*
          we have no roll stick input, so we will enter "roll locked"
          mode, and hold the roll we had when the stick was released
         */
        if (!acro_state.locked_roll) {
            acro_state.locked_roll = true;
            acro_state.locked_roll_err = 0;
        } else {
            acro_state.locked_roll_err += ahrs.get_gyro().x * G_Dt;
        }
        int32_t roll_error_cd = -ToDeg(acro_state.locked_roll_err)*100;
        nav_roll_cd = ahrs.roll_sensor + roll_error_cd;
        // try to reduce the integrated angular error to zero. We set
        // 'stabilze' to true, which disables the roll integrator
        channel_roll.set_servo_out(rollController.get_servo_out(roll_error_cd,
                                                                speed_scaler,
                                                                true));
    } else {
        /*
          aileron stick is non-zero, use pure rate control until the
          user releases the stick
         */
        acro_state.locked_roll = false;
        channel_roll.set_servo_out(rollController.get_rate_out(roll_rate,  speed_scaler));
    }

    if (g.acro_locking && is_zero(pitch_rate)) {
        /*
          user has zero pitch stick input, so we lock pitch at the
          point they release the stick
         */
        if (!acro_state.locked_pitch) {
            acro_state.locked_pitch = true;
            acro_state.locked_pitch_cd = ahrs.pitch_sensor;
        }
        // try to hold the locked pitch. Note that we have the pitch
        // integrator enabled, which helps with inverted flight
        nav_pitch_cd = acro_state.locked_pitch_cd;
        channel_pitch.set_servo_out(pitchController.get_servo_out(nav_pitch_cd - ahrs.pitch_sensor,
                                                                  speed_scaler,
                                                                  false));
    } else {
        /*
          user has non-zero pitch input, use a pure rate controller
         */
        acro_state.locked_pitch = false;
        channel_pitch.set_servo_out(pitchController.get_rate_out(pitch_rate, speed_scaler));
    }

    /*
      manual rudder for now
     */
//    steering_control.steering = steering_control.rudder = rudder_input;
}

/*
  main stabilization function for all 3 axes
 */
void Plane::stabilize()
{
    if (control_mode == MANUAL) {
        // nothing to do
        return;
    }
    // works out some scaling according to airspeed
    float speed_scaler = get_speed_scaler();

    if (control_mode == TRAINING) {
        stabilize_training(speed_scaler);
    } else if (control_mode == ACRO) {
        stabilize_acro(speed_scaler);
    } else {
        if (g.stick_mixing == STICK_MIXING_FBW && control_mode != STABILIZE) {
            stabilize_stick_mixing_fbw();
        }
        stabilize_roll(speed_scaler);
        stabilize_pitch(speed_scaler);
        if (g.stick_mixing == STICK_MIXING_DIRECT || control_mode == STABILIZE) {
            stabilize_stick_mixing_direct();
        }
       // stabilize_yaw(speed_scaler);
    }

    /*
      see if we should zero the attitude controller integrators. 
     */
    if (channel_throttle.get_control_in() == 0 &&
        relative_altitude_abs_cm() < 500 && 
        fabsf(barometer.get_climb_rate()) < 0.5f &&
        gps.ground_speed() < 3) {
        // we are low, with no climb rate, and zero throttle, and very
        // low ground speed. Zero the attitude controller
        // integrators. This prevents integrator buildup pre-takeoff.
        rollController.reset_I();
        pitchController.reset_I();
        yawController.reset_I();

        // if moving very slowly also zero the steering integrator
        if (gps.ground_speed() < 1) {
            steerController.reset_I();            
        }
    }
}


void Plane::calc_throttle()
{
    if (aparm.throttle_cruise <= 1) {
        channel_throttle.set_servo_out(0);
        return;
    }

    channel_throttle.set_servo_out(SpdHgt_Controller->get_throttle_demand());
}

/*****************************************
* Calculate desired roll/pitch/yaw angles (in medium freq loop)
*****************************************/

/*
  calculate yaw control for coordinated flight
 */
//void Plane::calc_nav_yaw_coordinated(float speed_scaler)
//{
//    bool disable_integrator = false;
//    if (control_mode == STABILIZE && rudder_input != 0) {
//        disable_integrator = true;
//    }
//    steering_control.rudder = yawController.get_servo_out(speed_scaler, disable_integrator);
//
//    // add in rudder mixing from roll
//    steering_control.rudder += channel_roll.get_servo_out() * g.kff_rudder_mix;
//    steering_control.rudder += rudder_input;
//    steering_control.rudder = constrain_int16(steering_control.rudder, -4500, 4500);
//}

/*
  calculate yaw control for ground steering with specific course
 */
//void Plane::calc_nav_yaw_course(void)
//{
//    // holding a specific navigation course on the ground. Used in
//    // auto-takeoff and landing
//    int32_t bearing_error_cd = nav_controller->bearing_error_cd();
//    steering_control.steering = steerController.get_steering_out_angle_error(bearing_error_cd);
//    if (stick_mixing_enabled()) {
//        stick_mix_channel(channel_rudder, steering_control.steering);
//    }
//    steering_control.steering = constrain_int16(steering_control.steering, -4500, 4500);
//}
//
//#if 0
///*
//  calculate yaw control for ground steering
// */
//void Plane::calc_nav_yaw_ground(void)
//{
//    if (gps.ground_speed() < 1 && 
//        channel_throttle.control_in == 0 &&
//        flight_stage != AP_SpdHgtControl::FLIGHT_TAKEOFF &&
//        flight_stage != AP_SpdHgtControl::FLIGHT_LAND_ABORT) {
//        // manual rudder control while still
//        steer_state.locked_course = false;
//        steer_state.locked_course_err = 0;
//        steering_control.steering = rudder_input;
//        return;
//    }
//
//    float steer_rate = (rudder_input/4500.0f) * g.ground_steer_dps;
//    if (flight_stage == AP_SpdHgtControl::FLIGHT_TAKEOFF ||
//        flight_stage == AP_SpdHgtControl::FLIGHT_LAND_ABORT) {
//        steer_rate = 0;
//    }
//    if (!is_zero(steer_rate)) {
//        // pilot is giving rudder input
//        steer_state.locked_course = false;        
//    } else if (!steer_state.locked_course) {
//        // pilot has released the rudder stick or we are still - lock the course
//        steer_state.locked_course = true;
//        if (flight_stage != AP_SpdHgtControl::FLIGHT_TAKEOFF &&
//            flight_stage != AP_SpdHgtControl::FLIGHT_LAND_ABORT) {
//            steer_state.locked_course_err = 0;
//        }
//    }
//    if (!steer_state.locked_course) {
//        // use a rate controller at the pilot specified rate
//        steering_control.steering = steerController.get_steering_out_rate(steer_rate);
//    } else {
//        // use a error controller on the summed error
//        int32_t yaw_error_cd = -ToDeg(steer_state.locked_course_err)*100;
//        steering_control.steering = steerController.get_steering_out_angle_error(yaw_error_cd);
//    }
//    steering_control.steering = constrain_int16(steering_control.steering, -4500, 4500);
//}
//#endif


/*
  calculate a new nav_pitch_cd from the speed height controller
 */
void Plane::calc_nav_pitch()
{
    // Calculate the Pitch of the plane
    // --------------------------------
    nav_pitch_cd = SpdHgt_Controller->get_pitch_demand();
    nav_pitch_cd = constrain_int32(nav_pitch_cd, pitch_limit_min_cd, aparm.pitch_limit_max_cd.get());
}


/*
  calculate a new nav_roll_cd from the navigation controller
 */
void Plane::calc_nav_roll()
{
    nav_roll_cd = nav_controller->nav_roll_cd();
    update_load_factor();
    nav_roll_cd = constrain_int32(nav_roll_cd, -roll_limit_cd, roll_limit_cd);
}


/*****************************************
* Throttle slew limit
*****************************************/
namespace {
   int16_t last_throttle = 0;
}
void Plane::throttle_slew_limit()
{
    uint8_t slewrate = aparm.throttle_slewrate;
    if (control_mode==AUTO && auto_state.takeoff_complete == false && g.takeoff_throttle_slewrate != 0) {
        slewrate = g.takeoff_throttle_slewrate;
    }
    // if slew limit rate is set to zero then do not slew limit
    if (slewrate) {                   
        // limit throttle change by the given percentage per second
        float temp = slewrate * G_Dt * 0.01f * fabsf(channel_throttle.get_radio_max() - channel_throttle.get_radio_min());
        // allow a minimum change of 1 PWM per cycle
        if (temp < 1) {
            temp = 1;
        }
        channel_throttle.set_radio_out(
            constrain_int16(channel_throttle.get_radio_out(), last_throttle - temp, last_throttle + temp)
        );
    }
    last_throttle = channel_throttle.get_radio_out();
}

/* We want to suppress the throttle if we think we are on the ground and in an autopilot controlled throttle mode.

   Disable throttle if following conditions are met:
   *       1 - We are in Circle mode (which we use for short term failsafe), or in FBW-B or higher
   *       AND
   *       2 - Our reported altitude is within 10 meters of the home altitude.
   *       3 - Our reported speed is under 5 meters per second.
   *       4 - We are not performing a takeoff in Auto mode or takeoff speed/accel not yet reached
   *       OR
   *       5 - Home location is not set
*/
bool Plane::suppress_throttle(void)
{    
    if (!throttle_suppressed) {
        // we've previously met a condition for unsupressing the throttle
        return false;
    }
    if (!auto_throttle_mode) {
        // the user controls the throttle
        throttle_suppressed = false;
        return false;
    }

    if (control_mode==AUTO && g.auto_fbw_steer) {
        // user has throttle control
        return false;
    }

    bool gps_movement = (gps.status() >= AP_GPS::GPS_OK_FIX_2D && gps.ground_speed() >= 5);
    
    if (control_mode==AUTO && 
        auto_state.takeoff_complete == false) {
#if CONFIG_HAL_BOARD == HAL_BOARD_QUAN
   using quan::max;
#endif
        uint32_t launch_duration_ms = ((int32_t)g.takeoff_throttle_delay)*100 + 2000;
        if (is_flying() &&
            millis() - started_flying_ms > max(launch_duration_ms,5000U) && // been flying >5s in any mode
            adjusted_relative_altitude_cm() > 500 && // are >5m above AGL/home
            labs(ahrs.pitch_sensor) < 3000 && // not high pitch, which happens when held before launch
            gps_movement) { // definate gps movement
            // we're already flying, do not suppress the throttle. We can get
            // stuck in this condition if we reset a mission and cmd 1 is takeoff
            // but we're currently flying around below the takeoff altitude
            throttle_suppressed = false;
            return false;
        }
        if (auto_takeoff_check()) {
            // we're in auto takeoff 
            throttle_suppressed = false;
            auto_state.baro_takeoff_alt = barometer.get_altitude();
            return false;
        }
        // keep throttle suppressed
        return true;
    }
    
    if (relative_altitude_abs_cm() >= 1000) {
        // we're more than 10m from the home altitude
        throttle_suppressed = false;
        gcs_send_text_fmt(MAV_SEVERITY_INFO, "Throttle enabled. Altitude %.2f",
                          (double)(relative_altitude_abs_cm()*0.01f));
        return false;
    }

    if (gps_movement) {
        // if we have an airspeed sensor, then check it too, and
        // require 5m/s. This prevents throttle up due to spiky GPS
        // groundspeed with bad GPS reception
        if ((!ahrs.airspeed_sensor_enabled()) || airspeed.get_airspeed() >= 5) {
            // we're moving at more than 5 m/s
            gcs_send_text_fmt(MAV_SEVERITY_INFO, "Throttle enabled. Speed %.2f airspeed %.2f",
                              (double)gps.ground_speed(),
                              (double)airspeed.get_airspeed());
            throttle_suppressed = false;
            return false;        
        }
    }

    // throttle remains suppressed
    return true;
}


/*
  return minimum throttle, taking account of throttle reversal
 */
uint16_t Plane::throttle_min(void) const
{
    return channel_throttle.get_reverse() ? channel_throttle.get_radio_max() : channel_throttle.get_radio_min();
};


/*****************************************
* Set the flight control servos based on the current calculated values
*****************************************/
void Plane::set_servos(void)
{
    if (control_mode == MANUAL) {
        // do a direct pass through of radio values
        channel_roll.set_radio_out(channel_roll.get_radio_in());  // can conv
        channel_pitch.set_radio_out(channel_pitch.get_radio_in()); //can conv
        channel_throttle.set_radio_out(channel_throttle.get_radio_in()); //can conv
        channel_rudder.set_radio_out(channel_rudder.get_radio_in()); // can conv

    } else {

        // for this function the value rc_channel.get_servo_out is converted and put to radio_out 
        // so essentially get_servo out is the autopilots input?
        channel_roll.calc_pwm();
        channel_pitch.calc_pwm();
        channel_rudder.calc_pwm();

        // convert 0 to 100% into PWM
        uint8_t min_throttle = aparm.throttle_min.get();
        uint8_t max_throttle = aparm.throttle_max.get();
        if (control_mode == AUTO && flight_stage == AP_SpdHgtControl::FLIGHT_LAND_FINAL) {
            min_throttle = 0;
        }
        if (control_mode == AUTO &&
            (flight_stage == AP_SpdHgtControl::FLIGHT_TAKEOFF || flight_stage == AP_SpdHgtControl::FLIGHT_LAND_ABORT)) {
            if(aparm.takeoff_throttle_max != 0) {
                max_throttle = aparm.takeoff_throttle_max;
            } else {
                max_throttle = aparm.throttle_max;
            }
        }

        // This is set in case throttle.cac_pwm is called
        channel_throttle.set_servo_out(constrain_int16(channel_throttle.get_servo_out(), 
                                                      min_throttle,
                                                      max_throttle));

        if (!hal.util->get_soft_armed()) {
            channel_throttle.set_servo_out(0);
            channel_throttle.calc_pwm();                
        } else if (suppress_throttle()) {
            // throttle is suppressed in auto mode
            channel_throttle.set_servo_out(0);
            if (g.throttle_suppress_manual) {
                // manual pass through of throttle while throttle is suppressed
                channel_throttle.set_radio_out(channel_throttle.get_radio_in());
            } else {
                channel_throttle.calc_pwm();                
            }
        } else if (g.throttle_passthru_stabilize && 
                   (control_mode == STABILIZE || 
                    control_mode == TRAINING ||
                    control_mode == ACRO ||
                    control_mode == FLY_BY_WIRE_A ||
                    control_mode == AUTOTUNE)) {
            // manual pass through of throttle while in FBWA or
            // STABILIZE mode with THR_PASS_STAB set
            channel_throttle.set_radio_out(channel_throttle.get_radio_in());
        } else if (control_mode == GUIDED && 
                   guided_throttle_passthru) {
            // manual pass through of throttle while in GUIDED
            channel_throttle.set_radio_out(channel_throttle.get_radio_in());
        } else {
            // normal throttle calculation based on servo_out
            channel_throttle.calc_pwm();
        }

    }

    if (control_mode >= FLY_BY_WIRE_B) {
        /* only do throttle slew limiting in modes where throttle
         *  control is automatic */
        throttle_slew_limit();
    }

    if (control_mode == TRAINING) {
        // copy rudder in training mode
        channel_rudder.set_radio_out(channel_rudder.get_radio_in());
    }

    if (!arming.is_armed()) {
        //Some ESCs get noisy (beep error msgs) if PWM == 0.
        //This little segment aims to avoid this.
        switch (arming.arming_required()) { 
        case AP_Arming::NO:
            //keep existing behavior: do nothing to radio_out
            //(don't disarm throttle channel even if AP_Arming class is)
            break;

        case AP_Arming::YES_ZERO_PWM:
            channel_throttle.set_radio_out(0);
            break;

        case AP_Arming::YES_MIN_PWM:
        default:
            channel_throttle.set_radio_out(throttle_min());
            break;
        }
    }

#if OBC_FAILSAFE == ENABLED
    // this is to allow the failsafe module to deliberately crash 
    // the plane. Only used in extreme circumstances to meet the
    // OBC rules
    obc.check_crash_plane();
#endif

#if HIL_SUPPORT
    if (g.hil_mode == 1) {
        // get the servos to the GCS immediately for HIL
        if (comm_get_txspace(MAVLINK_COMM_0) >= 
            MAVLINK_MSG_ID_RC_CHANNELS_SCALED_LEN + MAVLINK_NUM_NON_PAYLOAD_BYTES) {
            send_servo_out(MAVLINK_COMM_0);
        }
        if (!g.hil_servos) {
            return;
        }
    }
#endif

  // call mix here 
    channel_roll.output();
    channel_pitch.output();
    channel_throttle.output();
    channel_rudder.output();
}

void Plane::demo_servos(uint8_t i) 
{
    int16_t const save_channel_roll_radio_out = channel_roll.get_radio_out();
    while(i > 0) {
        gcs_send_text(MAV_SEVERITY_INFO,"Demo servos");
        demoing_servos = true;
        channel_roll.set_radio_out(1400);
        channel_roll.output();
        hal.scheduler->delay(400);
        channel_roll.set_radio_out(1600);
        channel_roll.output();
        hal.scheduler->delay(200);
        channel_roll.set_radio_out(1500);
        channel_roll.output();
        demoing_servos = false;
        hal.scheduler->delay(400);
        i--;
    }
    channel_roll.set_radio_out(save_channel_roll_radio_out);
    channel_roll.output();
}

/*
  adjust nav_pitch_cd for STAB_PITCH_DOWN_CD. This is used to make
  keeping up good airspeed in FBWA mode easier, as the plane will
  automatically pitch down a little when at low throttle. It makes
  FBWA landings without stalling much easier.
 */
void Plane::adjust_nav_pitch_throttle(void)
{
    uint8_t throttle = throttle_percentage();
    if (throttle < aparm.throttle_cruise) {
        float p = (aparm.throttle_cruise - throttle) / (float)aparm.throttle_cruise;
        nav_pitch_cd -= g.stab_pitch_down * 100.0f * p;
    }
}


/*
  calculate a new aerodynamic_load_factor and limit nav_roll_cd to
  ensure that the load factor does not take us below the sustainable
  airspeed
 */
void Plane::update_load_factor(void)
{
    float demanded_roll = fabsf(nav_roll_cd*0.01f);
    if (demanded_roll > 85) {
        // limit to 85 degrees to prevent numerical errors
        demanded_roll = 85;
    }
    aerodynamic_load_factor = 1.0f / safe_sqrt(cosf(radians(demanded_roll)));

    if (!aparm.stall_prevention) {
        // stall prevention is disabled
        return;
    }

    float max_load_factor = smoothed_airspeed / aparm.airspeed_min;
    if (max_load_factor <= 1) {
        // our airspeed is below the minimum airspeed. Limit roll to
        // 25 degrees
        nav_roll_cd = constrain_int32(nav_roll_cd, -2500, 2500);
        roll_limit_cd = constrain_int32(roll_limit_cd, -2500, 2500);
    } else if (max_load_factor < aerodynamic_load_factor) {
        // the demanded nav_roll would take us past the aerodymamic
        // load limit. Limit our roll to a bank angle that will keep
        // the load within what the airframe can handle. We always
        // allow at least 25 degrees of roll however, to ensure the
        // aircraft can be maneuvered with a bad airspeed estimate. At
        // 25 degrees the load factor is 1.1 (10%)
        int32_t roll_limit = degrees(acosf(sq(1.0f / max_load_factor)))*100;
        if (roll_limit < 2500) {
            roll_limit = 2500;
        }
        nav_roll_cd = constrain_int32(nav_roll_cd, -roll_limit, roll_limit);
        roll_limit_cd = constrain_int32(roll_limit_cd, -roll_limit, roll_limit);
    }    
}
