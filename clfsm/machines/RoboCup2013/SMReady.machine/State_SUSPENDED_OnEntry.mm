#ifdef DEBUG
fprintf(stderr, "SMPlayer State: %s\n", state_name());
#endif

suspend("SMHeadGoalTracker");

if(walk_status.get().controlStatus() != WALK_Disconnected)
{
	walk_post(WALK_Stop);
}


head.Stop();
head_ptr.set(head);
