suspend("SMSeeker");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
suspend("SMKicker");

if(walk_status.get().controlStatus() != WALK_Disconnected)
{
	walk_post(WALK_Stop);
}
HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);
