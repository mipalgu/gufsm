#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

suspend("SMHeadScanner");
suspend("SMWalkScanner");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
