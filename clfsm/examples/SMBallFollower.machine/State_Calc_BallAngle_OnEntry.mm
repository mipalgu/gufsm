#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ball = sightings_ptr.get().get_object(FVOBall);
body_sensors = body_sensors_ptr.get(); //need the head yaw


// k4VGA 1280 x 960
int guvision_width = 1280;
int guvision_height = 960;

int horiz_fov = 61;
int vert_fov = 48;
	
int ball_x = ball.x();
int ball_y = ball.y();
int ball_d = ball.distance();


//Work out yaw
int head_cam_ratio = guvision_width/horiz_fov;
int point_conv_to_cam_angle = -(ball_x/head_cam_ratio);



ballAngle = (float)RAD2DEG(body_sensors.HeadYaw()) + point_conv_to_cam_angle;
fprintf(stderr, "Ball angle with yaw %f\n", ballAngle);
