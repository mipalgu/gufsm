#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

leftGoalPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
rightGoalPost = sightings_ptr.get().get_object(FVOGoalPostRight);
crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
genericGoalPost = sightings_ptr.get().get_object(FVOGoalPost);
