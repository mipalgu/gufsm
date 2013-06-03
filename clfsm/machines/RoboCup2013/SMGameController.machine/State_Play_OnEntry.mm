restart("SMPlayer");

SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Green);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);

  cerr << "PLAY " << state_name() << endl;
		
		say("Play");


smGameState = aUDPReceiverNotificationType.get();
smGameState.set_theGSGameState(Playing);
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber) && smGameState.myPenaltyIs(myNumber) != ManualButtonPenalty;
														newScore=smGameState.getOurScore();

nao_state = nao_state_ptr.get();
