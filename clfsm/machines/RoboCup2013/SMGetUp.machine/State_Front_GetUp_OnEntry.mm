MOTION_SDK_Interface motion;


motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);

motion.set_motion_player(Motions::get_up_from_front_lie_down);
motion.set_motion_player_mask(true);


motion_ptr.set(motion);

say("Getup Front");
