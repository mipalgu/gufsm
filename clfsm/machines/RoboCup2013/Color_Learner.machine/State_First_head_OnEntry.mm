say("First shot");

head.GoToWithTime(0,PITCH_LIMIT_POS, 1000);
head_ptr.set(head);

motion.set_body_stiffness(false);
motion.set_body_stiffness_mask(true);
motion_ptr.set(motion);
