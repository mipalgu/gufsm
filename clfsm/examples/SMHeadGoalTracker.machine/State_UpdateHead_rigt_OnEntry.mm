body_sensors = body_sensors_ptr.get();


rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
	
int right_y = rightPost.y();
float angle = float(RAD2DEG(rightPost.horizontal_angle()));


//Work out pitch
int vert_head_cam_ratio = guvision_height/vert_fov;
int point_conv_to_cam_angle_y = right_y/vert_head_cam_ratio;
double body_relative_angle_y = RAD2DEG(body_sensors.HeadPitch()) + (point_conv_to_cam_angle_y);

std::cout << "RIGHT POST --> angle: " << angle << " - y: " << right_y << std::endl;


head.GoToWithTime((int)angle, (int)body_relative_angle_y, delay);
head_ptr.set(head);
