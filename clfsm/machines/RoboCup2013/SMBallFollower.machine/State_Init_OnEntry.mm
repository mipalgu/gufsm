#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ballAngle = 0;
localization_update_counter = 0;
min_long_distance_angle = 10;
min_short_distance_angle = 10;
boundaryCloseFar = 60; //cm

limiter = 4.0f;

large_turn = 50;

shortDistanceToBall = false;
forwardSpeed = 85.0;
