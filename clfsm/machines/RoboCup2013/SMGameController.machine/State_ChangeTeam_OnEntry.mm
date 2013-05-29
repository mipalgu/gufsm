stringstream ss;

ourTeamColour = TeamColours(! ourTeamColour);

ss << "Change Team: " << (ourTeamColour == TeamBlue ? "blue" : "red");

if (kickoffTeam == ourTeamColour)
	ss << " (our kickoff)!";

say(ss.str());
