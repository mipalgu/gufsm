using namespace std;

  cerr << "Starting in INT " << state_name() << endl;
  cerr << aUDPReceiverNotificationType.get().description() << endl;

	myNumber = thePlayerNumberOnTheBack;															

isPenalised = aUDPReceiverNotificationType.get().amIPenalized(myNumber);

suspend("SMPlayer");
