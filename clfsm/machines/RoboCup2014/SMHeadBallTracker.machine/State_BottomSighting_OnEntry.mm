body_sensors = body_sensors_ptr.get();


int 	delay = 150000;

vs = vs_t.get();

// k4VGA 1280 x 960
int guvision_width = vs.resolution().width();
int guvision_height = vs.resolution().height();

int horiz_fov = 61;
int vert_fov = 48;
	
//int ball_x = v.bottomBall().x();
//int ball_y = v.bottomBall().y();
int ball_x = fba.get_object(FVOBallBottom).x();
int ball_y = fba.get_object(FVOBallBottom).y();

//Work out yaw
int head_cam_ratio = guvision_width/horiz_fov;
int point_conv_to_cam_angle = -(ball_x/head_cam_ratio);
double body_relative_angle_x = RAD2DEG(body_sensors.HeadYaw()) + point_conv_to_cam_angle;

//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = ball_y/vert_head_cam_ratio;
double body_relative_angle_y = RAD2DEG(body_sensors.HeadPitch()) + (point_conv_to_cam_angle_y);

#ifdef DEBUG
fprintf(stderr, "Ball RR: %f\t%f\ty angle %d\tpitch %f\n", body_relative_angle_x, body_relative_angle_y, point_conv_to_cam_angle_y, RAD2DEG(body_sensors.HeadPitch()));
#endif



head.GoToWithTime((int)body_relative_angle_x, (int)body_relative_angle_y, delay);
head_ptr.set(head);
