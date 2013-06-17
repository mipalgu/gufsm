fprintf(stderr, "1\n");
motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);
fprintf(stderr, "2\n");
motion.set_motion_player(Motions::kneel);
motion.set_motion_player_mask(true);
fprintf(stderr, "3\n");
motion.set_head_stiffness(true);
motion.set_head_stiffness_mask(true);
motion_ptr.set(motion);

fprintf(stderr, "4\n");

vision.set_selectedCamera(Top);
vision.set_activatePipeline(OpenChallenge);
fprintf(stderr, "5\n");
vision.set_pipelineRunning(true);
vision.set_streamingSource(Normal);
fprintf(stderr, "6\n");
vision.set_openChallengeStep(0);
vision.set_resolution(VGA);
vision_ptr.set(vision);

fprintf(stderr, "7\n");

vision = VisionControlStatus();

control = 1;

fprintf(stderr, "8\n");
