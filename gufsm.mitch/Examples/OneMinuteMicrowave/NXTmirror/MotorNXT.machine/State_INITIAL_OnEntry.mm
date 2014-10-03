#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 //wb.addMessage("response_message", WBMsg("Message posted"), true);
// initially stop motors, and seed the whiteboard
WEBOTS_NXT_bridge  thetMotorCommand(0,MOVE_MOTORS,  0 , 0,false);
        //post the speed
        a_Command_Handler.set(thetMotorCommand);

motorSignal=0;
WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();
