#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

walk_post(WALK_ControlStatus(WALK_Run, float(fminf(10.0f+5.0f*float(ball.distance())/float(limiter), 50.0f)), 0, 0, 50));
