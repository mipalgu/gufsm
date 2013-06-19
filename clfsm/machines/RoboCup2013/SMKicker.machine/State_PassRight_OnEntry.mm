MOTION_SDK_Interface motion;


motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);

motion.set_motion_player(Motions::pass_ball_right);
motion.set_motion_player_mask(true);


motion_ptr.set(motion);
