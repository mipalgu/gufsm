#ifdef DEBUG
print_ptr("LIGHT_OFF");
#endif

// get the speed of the other motor, as we will repost it
otherMotorSpeedFound=false;
WEBOTS_NXT_bridge whatIsRunning=a_Info_Handler.get();
int otherMotorSpeed=0;
if (MOVE_MOTORS==whatIsRunning.theInstruction())
   {otherMotorSpeed=whatIsRunning.firstParameter(); otherMotorSpeedFound=true;
    WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS,  otherMotorSpeed,0,false);
   //post the speed
    a_Command_Handler.set(thetMotorCommand);
}

WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();

#ifdef DEBUG
fprintf(stderr,"lightSignal: %d\n",lightSignal); 
#endif
