#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 //wb.addMessage("response_message", WBMsg("Message posted"), true);

motorSignal=0;
WBMsg test =wb.getMessage("motor");
if (test.getType()==WBMsg::TypeInt)
   motorSignal=test.getIntValue();
