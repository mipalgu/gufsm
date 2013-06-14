#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

MOTION_SDK_Commands_t motion_ptr;
MOTION_SDK_Interface motion;
motion.set_head_stiffness(true);
motion.set_head_stiffness_mask(true);
motion_ptr(motion);
