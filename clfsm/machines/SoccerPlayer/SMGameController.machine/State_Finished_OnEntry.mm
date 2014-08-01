stateCount = 0;

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

MOTION_Commands motion;
motion.GoToStance(Motions::Standing_stance, Motions::Kneeling_stance);
motion_ptr.set(motion);

protected_usleep(2000000);

MOTION_Commands motion2(false, false, true);
motion_ptr.set(motion2);
