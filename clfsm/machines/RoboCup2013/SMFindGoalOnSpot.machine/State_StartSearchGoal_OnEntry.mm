MOTION_SDK_Interface motion;
motion.set_head_stiffness(true);
motion.set_head_stiffness_mask(true);
motion_ptr.set(motion);

restart("SMHeadScannerGoal");



rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);

std::cerr << rightPost.isVisible() << " " << leftPost.isVisible()<< " are visible?" << std::endl;
