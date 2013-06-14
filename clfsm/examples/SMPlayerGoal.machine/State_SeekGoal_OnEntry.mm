#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);


speak("Seek");

restart("SMHeadScannerGoal");
//restart("SMWalkScannerGoal");
