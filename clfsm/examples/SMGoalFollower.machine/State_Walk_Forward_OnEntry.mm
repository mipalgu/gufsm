#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif


walk_post(WALK_ControlStatus(WALK_Run, 50, 0, goalAngle, 50));
