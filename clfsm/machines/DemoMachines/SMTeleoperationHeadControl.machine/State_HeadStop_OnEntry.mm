MOTION_Commands motion;
motion.set_head_stiffness(0);
motion.set_head_stiffness_mask(1);
motionPtr->post(motion);
remoteControl=remoteControlPtr->get();