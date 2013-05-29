{
 using namespace std;

  cerr << "READY " << state_name() << endl;
		
   say("Ready");																											ourScore=aUDPReceiverNotificationType.get().getOurScore();

													cerr << "Our score " << ourScore<< endl;

smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);
												
}
