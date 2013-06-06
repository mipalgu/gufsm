#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

filteredObjects = sightings_ptr.get();

crossBar = filteredObjects.get_object(FVOGoalCrossBar);

localization_frameCounter = crossBar.frameCounter();
