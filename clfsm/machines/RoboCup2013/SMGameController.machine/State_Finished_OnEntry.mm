SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Off);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);

  cerr << "FINISHED " << state_name() << endl;
		
		say("Game over");
												
smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);



walk_post(WALK_ControlStatus(WALK_Disconnect));
protected_usleep(30000);

MOTION_SDK_Interface motion;
motion.set_body_stiffness(true);
motion.set_body_stiffness_mask(true);
motion.set_motion_player(Motions::kneel);
motion.set_motion_player_mask(true);
motion_ptr.set(motion);

protected_usleep(2000000);

MOTION_SDK_Interface motion2;
motion2.set_body_stiffness(false);
motion2.set_body_stiffness_mask(true);
motion2.set_head_stiffness(false);
motion2.set_head_stiffness_mask(true);
motion_ptr.set(motion2);
