suspend("SMSeeker");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
suspend("SMKicker");

WALK_ControlStatus_Mode walkMode = walk_status.get().controlStatus();

if (walkMode != WALK_Disconnected && walkMode != WALK_Stop && WALK_Stop != WALK_Ready)
{
	walk_post(WALK_Stop);
}
HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);