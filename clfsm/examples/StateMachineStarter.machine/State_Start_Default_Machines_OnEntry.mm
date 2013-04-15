say("Starting Machines"); 

	resume("Safety_BatteryMonitor");
//	resume("Safety_TempsMonitor");
//	resume("SMControllerLEDs");
	resume("SMRobotPosition");
 	resume("SMButtonChest"); 
 	resume("SMButtonLeftFoot"); 
 	resume("SMButtonRightFoot");




#ifdef DEBUG
fprintf(stderr, "State Starter: %s\n", state_name());
#endif
