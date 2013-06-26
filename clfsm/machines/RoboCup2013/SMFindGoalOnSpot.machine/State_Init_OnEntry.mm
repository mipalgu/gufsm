#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif


suspend("SMHeadGoalTracker");
suspend("SMHeadScannerGoal");
