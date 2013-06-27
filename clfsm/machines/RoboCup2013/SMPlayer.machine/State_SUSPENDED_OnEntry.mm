suspend("SMSeeker");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
suspend("SMKicker");

if (playerMachine != CLError && control_machine_at_index(playerMachine, CLSuspend) == CLError)
	cerr << "Error suspending " << playerMachine << " at index " << playerMachine << endl;

if(walk_status.get().controlStatus() != WALK_Disconnected)
{
	walk_post(WALK_Stop);
}
HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);
