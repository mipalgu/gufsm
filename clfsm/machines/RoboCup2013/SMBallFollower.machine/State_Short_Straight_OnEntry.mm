#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

walk_post(WALK_ControlStatus(WALK_Run, 7*ball.distance()/4, 0, 0, 100));
