stringstream ss;


kickoffTeam = TeamColours(!kickoffTeam);

ss << "Change Kickoff: " << (kickoffTeam == TeamBlue ? "blue" : "red");

if (kickoffTeam == ourTeamColour)
	ss << " (our kickoff)!";

say(ss.str());
