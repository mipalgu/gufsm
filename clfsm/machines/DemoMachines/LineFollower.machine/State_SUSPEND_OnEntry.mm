// STOP the motors
WEBOTS_NXT_bridge thetMotorCommand(robotID,MOVE_MOTORS, 0, 0,false);

//post the speed
a_Command_Handler.set(thetMotorCommand);