#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif


ball = sightings_ptr.get().get_object(FVOBall);




restart("SMHeadScanner");
restart("SMWalkScanner");
