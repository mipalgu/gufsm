{
   using namespace std;

  cerr << "SET " << state_name() << endl;
		
		say("Set");

smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);
													}
