#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ball = ball_ptr.get();

localization_frameCounter = ball.frameCounter();
