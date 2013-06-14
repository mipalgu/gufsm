#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

speak("Forward");

walk_post(WALK_ControlStatus(WALK_Run, 40, 0, ballAngle/5, 50));
