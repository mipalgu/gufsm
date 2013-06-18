body_sensors = body_sensors_ptr.get(); //need the head yaw
int angle = (float)(body_sensors.HeadYaw());

walk_post(WALK_ControlStatus(WALK_Run, 0, 0, angle/4.0, 49));
