#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

walk_post(WALK_ControlStatus(WALK_Run, (float)fmax((float)5*(float)ball.distance()/(float)limiter, 40.0f), 0, 0, 40));
