#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

lightSignal=0;
WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();
