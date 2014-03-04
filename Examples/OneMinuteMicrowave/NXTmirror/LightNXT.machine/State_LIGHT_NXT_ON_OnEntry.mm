#ifdef DEBUG
print_ptr("LIGHT_ON");
#endif

 WEBOTS_NXT_bridge  thetMotorCommand(0,ONE_MOTOR_SETTING,  RIGHT_MOTOR_DIFFERENTIAL,50,false);
    //post the speed
    a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"lightSignal: %d\n",lightSignal); 
#endif
