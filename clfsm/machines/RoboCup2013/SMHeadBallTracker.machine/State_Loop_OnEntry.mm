#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ball = ball_on_whiteboard();

localization_frameCounter = ball.frameCounter();
