using namespace std;

	myNumber = thePlayerNumberOnTheBack;															

    cerr << state_name() << " player " << myNumber << endl;

	say("I'm in Initial");

smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();

SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, Off);
ledValues.LEDsGroupChange(LFoot, ourTeamColour == TeamBlue ? Blue : Red);
ledValues.LEDsGroupChange(RFoot, kickoffTeam == TeamBlue ? Blue : Red);
leds.set(ledValues);