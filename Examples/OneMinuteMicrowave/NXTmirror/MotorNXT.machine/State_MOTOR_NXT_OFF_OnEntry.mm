#ifdef DEBUG
print_ptr("MOTOR_OFF");
#endif

WEBOTS_NXT_bridge 
thetMotorCommand(0,MOVE_MOTORS, 0, 0,false);

//post the speed
a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"motorSignal: %d\n",motorSignal); 
#endif
