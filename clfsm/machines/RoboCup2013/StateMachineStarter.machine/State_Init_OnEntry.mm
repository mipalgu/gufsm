//	extern shortChestButtonPressed;
//	extern rightFootBumpPressed;
//	extern leftFootBumpPressed;
//	extern playerNumber;
//	extern wbStartGameController;
//	extern wbStopFSMs;

int player = getplayernumber();
say("Player number");
say(gu_ltos(player));

suspend_all();

#ifdef DEBUG
fprintf(stderr, "State Starter: %s\n", state_name());
#endif