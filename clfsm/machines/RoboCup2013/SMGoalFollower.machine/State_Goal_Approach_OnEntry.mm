walk_post(WALK_ControlStatus(WALK_Stop));

suspend("SMHeadGoalTracker");
suspend("SMHeadScannerGoal");
suspend("SMGetCloseToGoal");
restart("SMWalkToLine2");
