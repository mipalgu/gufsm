#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
// STOP the motors
WEBOTS_NXT_bridge thetMotorCommand(robotID,MOVE_MOTORS, 0, 0,false);
a_Command_Handler.set(thetMotorCommand);
