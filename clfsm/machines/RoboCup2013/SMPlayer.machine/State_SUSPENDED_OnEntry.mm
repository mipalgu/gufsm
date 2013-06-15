suspend("SMHeadScanner");
suspend("SMWalkScanner");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
suspend("SMKicker");

#ifdef DEBUG
fprintf(stderr, "SMPlayer State: %s\n", state_name());
#endif


WALK_Status_t walk_status;
if(walk_status.get().controlStatus() != WALK_Disconnected)
{
	walk_post(WALK_Stop);
}
HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);
