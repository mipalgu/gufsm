#ifdef DEBUG
print_ptr("MOTOR_OFF");
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif
// get the speed of the other motor, as we will repost it
otherMotorSpeedFound=false;
WEBOTS_NXT_bridge whatIsRunning=a_Info_Handler.get();
int otherMotorSpeed=0;
if (MOVE_MOTORS==whatIsRunning.theInstruction())
   { otherMotorSpeed=whatIsRunning.secondParameter(); otherMotorSpeedFound=true;
    WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS, 0, otherMotorSpeed,false);
    //post the speed
    a_Command_Handler.set(thetMotorCommand);
}

WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"motorSignal: %d\n",motorSignal); 
#endif
