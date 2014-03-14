#ifdef DEBUG
print_ptr("LIGHT_ON");
#endif

  //post the light off
    WEBOTS_NXT_bridge_t  thetStatusCommand_ptr;
    int other_speed = (thetStatusCommand_ptr.get() ).firstParameter();

    WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS,other_speed,50,false);
    a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"lightSignal: %d\n",lightSignal); 
#endif
