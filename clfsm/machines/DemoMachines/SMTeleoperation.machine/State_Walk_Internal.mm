remoteControl=remoteControlPtr->get();
if(fabs(currentFoward - remoteControl.fowardWalkSpeed()) > 0.01 || fabs(currentTurn - remoteControl.turnWalkSpeed()) > 0.01) {
	WALK_ControlStatus walk;
	walk.set_controlStatus(WALK_Run);
	walk.set_power(100);
	walk.set_forward(remoteControl.fowardWalkSpeed());
	walk.set_turn(remoteControl.turnWalkSpeed());
	walkPtr->post(walk);
}
