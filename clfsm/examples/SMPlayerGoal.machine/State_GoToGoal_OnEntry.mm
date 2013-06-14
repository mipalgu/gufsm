#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);

cout << "DISTANCE TO CROSSBAR: " << crossBar.distance() << endl;


speak("Positioning");

restart("SMGoalFollower");

restart("SMHeadGoalTracker");
