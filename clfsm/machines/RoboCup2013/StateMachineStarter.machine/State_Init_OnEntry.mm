//	extern shortChestButtonPressed;
//	extern rightFootBumpPressed;
//	extern leftFootBumpPressed;
//	extern playerNumber;
//	extern wbStartGameController;
//	extern wbStopFSMs;
int player = getplayernumber();
spokeIP = false;
say("Player number");
say(gu_ltos(player));

suspend_all();

#ifdef DEBUG
fprintf(stderr, "State Starter: %s\n", state_name());
printf("State Starter: %s\n", state_name());
#endif
