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

fprintf(stderr, "Ball: x %d y %d diet %d\n", ball_x, ball_y, ball_d);

//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = ball_y/vert_head_cam_ratio;
double body_relative_angle_y = RAD2DEG(body_sensors.HeadPitch()) + (point_conv_to_cam_angle_y);

head.GoToWithTime_rad(ball.horizontal_angle()/40, (float)DEG2RAD(body_relative_angle_y)/40, 10000);
head_ptr.set(head);
