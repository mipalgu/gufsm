#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 wb.addMessage("buttonPushed", WBMsg(true), true);

WEBOTS_NXT_bridge theInfo= touch_data_ptr.get();
if ( (TOUCH==theInfo.theInstruction()  )&& (theInfo.firstParameter()==LEFT_TOUCH_SENSOR))
     pressed= theInfo.secondParameter();
else
     pressed=false;

