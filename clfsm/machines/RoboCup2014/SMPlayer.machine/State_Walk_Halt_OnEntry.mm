WALK_ControlStatus_Mode walkMode = walk_status.get().controlStatus();

waitForStop = false;
if (walkMode != WALK_Disconnected && walkMode != WALK_Stop && WALK_Stop != WALK_Ready)
{
	walk_post(WALK_Stop);
	waitForStop = true;
}