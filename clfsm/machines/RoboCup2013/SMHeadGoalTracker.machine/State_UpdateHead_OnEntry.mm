body_sensors = body_sensors_ptr.get();

crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
	
int cross_y = crossBar.y();
angle = float(RAD2DEG(crossBar.horizontal_angle()));

//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = cross_y/vert_head_cam_ratio;
double body_relative_angle_y = RAD2DEG(body_sensors.HeadPitch()) + (point_conv_to_cam_angle_y);

std::cout << "CROSS BAR --> yaw angle: " << angle << " - y: " << cross_y << std::endl;

head.GoToWithTime((int) angle, (int)body_relative_angle_y, delay);
head_ptr.set(head);
