#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

walk_post(WALK_ControlStatus(WALK_Run, fmax(5*ball.distance()/limiter, 30), 0, 0, 100));
