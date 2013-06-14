#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ballAngle = 0;
localization_update_counter = 0;
min_long_distance_angle = 15;
min_short_distance_angle = 15;
boundaryCloseFar = 200; //cm
