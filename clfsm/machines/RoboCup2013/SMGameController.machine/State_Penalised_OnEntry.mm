numberOfPenalties++;

SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Red);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);

cerr << "Penalised " << state_name() << endl;
		
say("Pennalised");

penalisedThroughChestButton = nao_state.chest_pressed() > 0;

nao_state = nao_state_ptr.get();
if (penalisedThroughChestButton) smGameState.setMyPenalty(myNumber,ManualButtonPenalty);
postGS(smGameState);
