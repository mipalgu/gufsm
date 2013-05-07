#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

walk_post(WALK_ControlStatus(WALK_Run, 100, 0, ballAngle, 100));
