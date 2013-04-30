int FIXED_FACTOR = 100;
int 	delay = 100000;

// k4VGA 1280 x 960
int guvision_width = 1280;
int guvision_height = 960;

int horiz_fov = 61;
int vert_fov = 48;
int tx =  tan(horiz_fov/2);
int ty =  tan(vert_fov/2);
int x_per_cm_dist = FIXED_FACTOR/2 * guvision_width  / tx;
int y_per_cm_dist = FIXED_FACTOR/2 * guvision_height / ty;
int track_smoothness = 4;

body_sensors = body_sensors_ptr.get();
	
int ball_x = ball.x();
int ball_y = ball.y();
int ball_d = ball.distance();


tx = FIXED_FACTOR * ball_x / x_per_cm_dist;
ty = FIXED_FACTOR * ball_y / y_per_cm_dist;

int zPos = (body_sensors.HeadYaw_degrees() * (track_smoothness-1) - 2*atan(tx)) / track_smoothness;
int yPos = (body_sensors.HeadPitch_degrees() * (track_smoothness-1) + 2*atan(ty)) / track_smoothness;




int head_cam_ratio = guvision_width/horiz_fov;
int point_conv_to_cam_angle = -(ball_x/head_cam_ratio);
int body_relative_angle_x = body_sensors.HeadYaw_degrees() + point_conv_to_cam_angle;


int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = ball_y/vert_head_cam_ratio;
int body_relative_angle_y = body_sensors.HeadPitch_degrees() + (point_conv_to_cam_angle_y);


fprintf(stderr, "Ball RR: %d\t%d\ty angle %d\tpitch %f\n", body_relative_angle_x, body_relative_angle_y, point_conv_to_cam_angle_y, body_sensors.HeadPitch_degrees());




head.GoToWithTime(body_relative_angle_x, body_relative_angle_y, delay);
head_ptr.set(head);


//fprintf(stderr, "Ball: %s\n", (char *)ball.description().c_str());
//fprintf(stderr, "Head: %d\t%d\t%d\n", zPos, yPos, delay);
