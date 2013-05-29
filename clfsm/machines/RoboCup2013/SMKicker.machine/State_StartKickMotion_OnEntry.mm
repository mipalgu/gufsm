/* Ask robot to perform pre-recorded kick motion. */

MOTION_SDK_Interface motion;

motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);

motion.set_motion_player(Motions::right_kick);
motion.set_motion_player_mask(true);

wb_MotionCommand.set(motion);
