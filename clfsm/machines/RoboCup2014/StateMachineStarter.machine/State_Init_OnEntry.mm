//	extern shortChestButtonPressed;
//	extern rightFootBumpPressed;
//	extern leftFootBumpPressed;
//	extern playerNumber;
//	extern wbStartGameController;
//	extern wbStopFSMs;

suspend_all();

#ifdef DEBUG
fprintf(stderr, "State Starter: %s\n", state_name());
#endif

file_exists(SPOKE_FILE) ? spokeIP = true : spokeIP = false;

clfsm_delay = TRANSITION_WAIT_TIME;
