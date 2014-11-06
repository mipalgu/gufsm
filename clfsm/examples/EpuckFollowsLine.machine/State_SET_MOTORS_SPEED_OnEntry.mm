#ifdef DEBUG
std::string stateName("STATE: ");
stateName+=state_name();
print_ptr(stateName);
#endif
WEBOTS_NXT_bridge thetMotorCommand(robotID,MOVE_MOTORS,static_cast<int16_t>(leftSpeed/maxSpeed), static_cast<int16_t>(rightSpeed/maxSpeed),false);
//post the speed
a_Command_Handler.set(thetMotorCommand);
