body_sensors = body_sensors_ptr.get();


int 	delay = 100000;


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
float body_relative_angle_x = body_sensors.HeadYaw_degrees() + point_conv_to_cam_angle;

//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = ball_y/vert_head_cam_ratio;
float body_relative_angle_y = body_sensors.HeadPitch_degrees() + (point_conv_to_cam_angle_y);

#ifdef DEBUG
fprintf(stderr, "Ball RR: %f\t%f\ty angle %d\tpitch %f\n", body_relative_angle_x, body_relative_angle_y, point_conv_to_cam_angle_y, body_sensors.HeadPitch_degrees());
#endif



head.GoToWithTime((int)body_relative_angle_x, (int)body_relative_angle_y, delay);
head_ptr.set(head);
