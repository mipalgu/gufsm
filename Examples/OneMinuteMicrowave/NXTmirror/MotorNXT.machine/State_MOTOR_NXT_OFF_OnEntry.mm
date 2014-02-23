#ifdef DEBUG
print_ptr("MOTOR_ON_FORWARD_TO_NXT");
#endif

WEBOTS_NXT_bridge 
thetMotorCommand(0,MOVE_MOTORS, 0, 0,false);

//post the speed
a_Command_Handler.set(thetMotorCommand);
