body_sensors = body_sensors_ptr.get();
int 	delay = 150000;

// k4VGA 1280 x 960
int guvision_width = 1280;
int guvision_height = 960;

int horiz_fov = 61;
int vert_fov = 48;
	
int ball_x = ball.x();
int ball_y = ball.y();
int ball_d = ball.distance();

//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = ball_y/vert_head_cam_ratio;
double body_relative_angle_y = RAD2DEG(body_sensors.HeadPitch()) + (point_conv_to_cam_angle_y);


head.GoToWithTime((int)ball.horizontal_angle(), (int)body_relative_angle_y, delay);
head_ptr.set(head);
