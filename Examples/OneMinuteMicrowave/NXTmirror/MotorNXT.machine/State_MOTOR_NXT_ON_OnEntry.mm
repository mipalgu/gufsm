#ifdef DEBUG
print_ptr("MOTOR_ON"); fprintf(stderr,"STATE: %s\n",state_name()); 
#endif
 
 WEBOTS_NXT_bridge  thetMotorCommand(0,ONE_MOTOR_SETTING, 50, LEFT_MOTOR_DIFFERENTIAL,false);
    //post the speed
    a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"motorSignal: %d\n",motorSignal); 
#endif
