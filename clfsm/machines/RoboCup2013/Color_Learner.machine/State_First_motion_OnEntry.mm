motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);
motion.set_motion_player(Motions::kneel);
motion.set_motion_player_mask(true);
motion.set_head_stiffness(true);
motion.set_head_stiffness_mask(true);
motion_ptr.set(motion);


vision.set_selectedCamera(Top);
vision.set_activatePipeline(OpenChallenge);
vision.set_pipelineRunning(true);
vision.set_streamingSource(Normal);
vision.set_openChallengeStep(0);
vision.set_resolution(VGA);
vision_ptr.set(vision);

vision = VisionControlStatus();

control = 1;
