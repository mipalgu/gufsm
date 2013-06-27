status = walk_status();
currentOdometry = status.odometry().turn;



rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
stateCount++;
