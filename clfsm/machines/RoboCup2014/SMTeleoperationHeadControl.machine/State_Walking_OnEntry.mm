remoteControl=remoteControlPtr->get();
MOTION_Commands motion;
motion.set_head_stiffness(1);
motion.set_head_stiffness_mask(1);
motionPtr->post(motion);
