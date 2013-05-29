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
