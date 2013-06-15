#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ballAngle = 0;
localization_update_counter = 0;
min_long_distance_angle = 10;
min_short_distance_angle = 10;
boundaryCloseFar = 50; //cm

limiter = 4;
