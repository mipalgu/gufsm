say("Colors learnt OH YEAH");

vision = VisionControlStatus();
vision.set_activatePipeline(Soccer);
vision.set_pipelineRunning(true);
vision.set_streamingSource(Classified);
vision.set_resolution(HD_4VGA);
vision_ptr.set(vision);



/*motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);

motion.set_motion_player(Motions::get_up_from_kneel);
motion.set_motion_player_mask(true);


motion_ptr.set(motion);*/
