MOTION_SDK_Interface motion;

motion.set_motion_player(Motions::dcm_from_getup);
motion.set_motion_player_mask(true);


motion_ptr.set(motion);
