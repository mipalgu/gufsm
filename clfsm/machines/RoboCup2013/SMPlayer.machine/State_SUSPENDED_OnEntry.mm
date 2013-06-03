suspend("SMHeadScanner");
suspend("SMWalkScanner");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");

#ifdef DEBUG
fprintf(stderr, "SMPlayer State: %s\n", state_name());
#endif
