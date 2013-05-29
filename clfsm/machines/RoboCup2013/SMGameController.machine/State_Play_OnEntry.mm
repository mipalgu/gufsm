using namespace std;

	restart("SMPlayer");

  cerr << "PLAY " << state_name() << endl;
		
		say("Play");


smGameState = aUDPReceiverNotificationType.get();
smGameState.set_theGSGameState(Playing);
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);
														newScore=smGameState.getOurScore();
