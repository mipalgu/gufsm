#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

filteredObjects = sightings_ptr.get();

ball = filteredObjects.get_object();

localization_frameCounter = ball.frameCounter();