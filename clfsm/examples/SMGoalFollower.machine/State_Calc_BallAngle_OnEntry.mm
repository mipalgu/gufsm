body_sensors = body_sensors_ptr.get(); //need the head yaw

goalAngle = (float)(body_sensors.HeadYaw());

std::cout << "GOAL ANGLE WITH YAW: " << goalAngle << std::endl;

rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
