using namespace std;

cerr << "Penalised " << state_name() << endl;
		
say("Penalised");

penalisedThroughChestButton = nao_state.chest_pressed() > 0;

nao_state = nao_state_ptr.get();
//smGameState.set_amIPenalized(myNumber);
postGS(smGameState);
