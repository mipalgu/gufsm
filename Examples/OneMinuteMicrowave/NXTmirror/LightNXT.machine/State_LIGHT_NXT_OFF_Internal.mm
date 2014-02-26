WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();

WEBOTS_NXT_bridge whatIsRunning=a_Info_Handler.get();
int otherMotorSpeed=0;
if (MOVE_MOTORS==whatIsRunning.theInstruction())
   {otherMotorSpeed=whatIsRunning.firstParameter(); otherMotorSpeedFound=true;
    WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS,  otherMotorSpeed,0,false);
   //post the speed
    a_Command_Handler.set(thetMotorCommand);
}
