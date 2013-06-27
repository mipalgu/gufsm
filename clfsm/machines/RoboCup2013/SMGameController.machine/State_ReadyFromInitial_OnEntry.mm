MOTION_SDK_Interface motion;
motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);
motion.set_motion_player(Motions::dcm_from_getup);
motion.set_motion_player_mask(true);

motion_ptr.set(motion);

resetParticleFilter(PF_New_Game);
readyFromInitial=true;
