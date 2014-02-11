WALK_ControlStatus walk;
walk.set_controlStatus(WALK_Run);
walk.set_power(100);
walk.set_forward(remoteControl.fowardWalkSpeed());
walk.set_turn(remoteControl.turnWalkSpeed());
walkPtr->post(walk);
currentFoward = remoteControl.fowardWalkSpeed();
currentTurn = remoteControl.turnWalkSpeed();
