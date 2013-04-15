say("Starting Machines"); 

	resume("Safety_BatteryMonitor");
//	resume("Safety_TempsMonitor");
//	resume("SMControllerLEDs");
	resume("SMRobotPosition");
 	resume("SMButtonChest"); 
 	resume("SMButtonLeftFoot"); 
 	resume("SMButtonRightFoot");

nao_state = nao_state_ptr.get();
fprintf(stderr, "Entry: %s\n", (char *)nao_state.description().c_str());
