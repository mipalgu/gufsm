printf("SAVE RIGHT\n");

MOTION_SDK_Interface motion;

motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);

motion.set_motion_player(Motions::right_goalie_block);
motion.set_motion_player_mask(true);

//wbMotion.set(motion);
