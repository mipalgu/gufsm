using namespace std;

trustUDP = true;
numberOfPenalties = 0;
readyFromInitial=false;

nao_state = nao_state_ptr.get();

  cerr << "--> GC 2.0 NOGETUP <-- starting in " << state_name() << " with chest button " << nao_state.chest_pressed() << endl;
  cerr << aUDPReceiverNotificationType.get().description() << endl;

	myNumber = thePlayerNumberOnTheBack;															

isPenalised = aUDPReceiverNotificationType.get().amIPenalized(myNumber);