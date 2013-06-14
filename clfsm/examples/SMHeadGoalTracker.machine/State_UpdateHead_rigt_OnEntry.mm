body_sensors = body_sensors_ptr.get();


crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
genericPost = sightings_ptr.get().get_object(FVOGoalPost);


// k4VGA 1280 x 960
int guvision_width = 1280;
int guvision_height = 960;

int horiz_fov = 61;
int vert_fov = 48;
	
int ball_x = rightPost.x() - 10;
int ball_y = rightPost.y();
int ball_d = rightPost.distance();
float angle = float(RAD2DEG(rightPost.horizontal_angle()));

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


head.GoToWithTime((int)angle, (int)body_relative_angle_y, delay);
head_ptr.set(head);
