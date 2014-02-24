#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 wb.addMessage("doorOpen", WBMsg(true), true);

WEBOTS_NXT_bridge theInfo= touch_data_ptr.get();
if ( (TOUCH==theInfo.theInstruction()  )&& (theInfo.firstParameter()==RIGHT_TOUCH_SENSOR))
     doorOpen= !theInfo.secondParameter();
else
     doorOpen=true;
