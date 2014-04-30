#ifdef DEBUG
     std::string stateName("STATE: "); stateName+=state_name(); print_ptr(stateName);
    fprintf(stderr, "STATE: %s\n", state_name());
#endif
     robotID=0;
     speedToUse=200;
     leftSpeed=0; rightSpeed=0;
     cameraWidth=0;
     delta=0; maxSpeed=0.0;
     //Follow magenta
     theChannel=GREEN_CHANNEL;
     //Follow blue
     theChannel=RED_CHANNEL;
     //Follow yellow
     theChannel=BLUE_CHANNEL;
WEBOTS_NXT_bridge a_Command(robotID,CAMERA,theChannel,1);
     a_Command_Handler.set(a_Command);
     // STOP the motors
//WEBOTS_NXT_bridge thetMotorCommand(robotID,MOVE_MOTORS, 0, 0,false);
//a_Command_Handler.set(thetMotorCommand);
