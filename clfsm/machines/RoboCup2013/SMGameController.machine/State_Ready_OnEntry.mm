SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Blue);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);

  DBG(cerr << "READY " << state_name() << endl);
	
   say("Ready");																											ourScore=aUDPReceiverNotificationType.get().getOurScore();

													cerr << "Our score " << ourScore<< endl;

smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);

nao_state = nao_state_ptr.get();

if (readyFromInitial)
	restart("SMReadyFromInitial");
else
	restart("SMReadyFromAnywhere");
