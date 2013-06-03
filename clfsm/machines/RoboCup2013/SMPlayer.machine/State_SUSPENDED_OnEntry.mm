suspend("SMHeadScanner");
suspend("SMWalkScanner");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");

#ifdef DEBUG
fprintf(stderr, "SMPlayer State: %s\n", state_name());
#endif


WALK_Command_t walk_post;
walk_post(WALK_Stop);

HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);
