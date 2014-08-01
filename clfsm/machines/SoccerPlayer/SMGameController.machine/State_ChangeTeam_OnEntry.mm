stringstream ss;

ourTeamColour = TeamColours(! ourTeamColour);

SENSORS_LedsSensors ledValues = leds.get();
ledValues.LEDsGroupChange(Chest, ourTeamColour == TeamBlue ? Blue : Red);
leds.set(ledValues);

ss << "Change Team: " << (ourTeamColour == TeamBlue ? "blue" : "red");

if (kickoffTeam == ourTeamColour)
	ss << " (our kickoff)!";

say(ss.str());
