using namespace std;

nao_state = nao_state_ptr.get();

  cerr << "Starting in " << state_name() << " with chest button " << nao_state.chest_pressed() << endl;
  cerr << aUDPReceiverNotificationType.get().description() << endl;

	myNumber = thePlayerNumberOnTheBack;															

isPenalised = aUDPReceiverNotificationType.get().amIPenalized(myNumber);
