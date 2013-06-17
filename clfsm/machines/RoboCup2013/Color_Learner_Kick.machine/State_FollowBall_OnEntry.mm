#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

ball = sightings_ptr.get();


restart("SMBallFollower");
restart("SMHeadBallTracker");
