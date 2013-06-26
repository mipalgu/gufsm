SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Yellow);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);

  cerr << "SET " << state_name() << endl;
		
		say("Set");

smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);

restart("SMSet");
