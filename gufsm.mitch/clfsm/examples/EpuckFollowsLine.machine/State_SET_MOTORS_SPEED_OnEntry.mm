#ifdef DEBUG
     std::string stateName("STATE: "); stateName+=state_name(); print_ptr(stateName);
     #endif
printf("maxSpeed = %d\n",maxSpeed);
WEBOTS_NXT_bridge
     thetMotorCommand(robotID,MOVE_MOTORS, leftSpeed/maxSpeed, rightSpeed/maxSpeed,false);
     //post the speed
     a_Command_Handler.set(thetMotorCommand);
