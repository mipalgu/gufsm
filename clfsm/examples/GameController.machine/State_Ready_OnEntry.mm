{
 using namespace std;

  cerr << "READY " << state_name() << endl;
		
   say("Ready");																											ourScore=aUDPReceiverNotificationType.get().getOurScore();

													cerr << "Our score " << ourScore<< endl;

    gameState = aUDPReceiverNotificationType.get().theUDPGameState();
												
}
