#ifdef DEBUG
print_ptr("MOTOR_ON"); fprintf(stderr,"STATE: %s\n",state_name()); 
#endif
 
   //post the speed
    WEBOTS_NXT_bridge_t  thetStatusCommand_ptr;
    int other_speed = (thetStatusCommand_ptr.get() ).secondParameter();

    WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS, 50,other_speed,false);
    a_Command_Handler.set(thetMotorCommand);

WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"motorSignal: %d\n",motorSignal); 
#endif
