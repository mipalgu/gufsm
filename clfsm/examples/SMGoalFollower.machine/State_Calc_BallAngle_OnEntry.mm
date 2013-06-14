#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

body_sensors = body_sensors_ptr.get(); //need the head yaw

// k4VGA 1280 x 960
int guvision_width = 1280;
int guvision_height = 960;
int horiz_fov = 61;
int vert_fov = 48;
	

ballAngle = (float)(body_sensors.HeadYaw());

fprintf(stderr, "Ball angle with yaw %f\n", ballAngle);
