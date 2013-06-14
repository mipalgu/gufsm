#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

time = 100000;
delay = 250000;


crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
genericPost = sightings_ptr.get().get_object(FVOGoalPost);


std::cout << "CROSS VISIBLE: " << crossBar.isVisible() << std::endl;
std::cout << "RIGHT VISIBLE: " << rightPost.isVisible() << std::endl;
std::cout << "LEFT VISIBLE: " << leftPost.isVisible() << std::endl;
std::cout << "GENERIC VISIBLE: " << genericPost.isVisible() << std::endl;
std::cout << "10" << std::endl;
