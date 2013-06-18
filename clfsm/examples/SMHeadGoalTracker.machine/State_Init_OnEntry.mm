delay = 200000;

guvision_width = 1280;
guvision_height = 960;

horiz_fov = 61;
vert_fov = 48;

crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
genericPost = sightings_ptr.get().get_object(FVOGoalPost);

std::cout << "CROSS VISIBLE: " << crossBar.isVisible() << std::endl;
std::cout << "RIGHT VISIBLE: " << rightPost.isVisible() << std::endl;
std::cout << "LEFT VISIBLE: " << leftPost.isVisible() << std::endl;
std::cout << "GENERIC VISIBLE: " << genericPost.isVisible() << std::endl;
