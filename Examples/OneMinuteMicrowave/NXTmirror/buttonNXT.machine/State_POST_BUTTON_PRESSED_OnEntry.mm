#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 wb.addMessage("buttonPushed", WBMsg(true), true);
/*
WEBOTS_NXT_bridge theInfo= touch_data_ptr.get();
if ("SENSORTOUCH) && theInfo.firstParameter()=LeftTouch)
     pressed= theInfo.secondParametr();
else
     pressed=false;
*/
