crossBar = sightings_ptr.get().get_object(FVOGoalCrossBar);
rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
genericPost = sightings_ptr.get().get_object(FVOGoalPost);


restart("SMHeadScannerGoal");
restart("SMWalkScanner");
