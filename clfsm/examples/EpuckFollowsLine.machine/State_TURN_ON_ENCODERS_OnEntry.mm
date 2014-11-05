#ifdef DEBUG
std::string stateName("STATE: ");
stateName+=state_name();
print_ptr(stateName);
#endif
WEBOTS_NXT_bridge commandLeft(robotID,ROTATION_ENCODER,LEFT_MOTOR_DIFFERENTIAL,1);
WEBOTS_NXT_bridge commandRight(robotID,ROTATION_ENCODER,RIGHT_MOTOR_DIFFERENTIAL,1);
a_Command_Handler.set(commandLeft);
a_Command_Handler.set(commandRight);
