#ifdef DEBUG
print_ptr("MOTOR_OFF");
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

    WEBOTS_NXT_bridge  thetMotorCommand(0,ONE_MOTOR_SETTING, LEFT_MOTOR_DIFFERENTIAL,0,false);
    //post the speed
    a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"motorSignal: %d\n",motorSignal); 
#endif
