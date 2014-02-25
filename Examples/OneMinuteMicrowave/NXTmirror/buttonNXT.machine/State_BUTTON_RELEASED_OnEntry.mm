
#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 wb.addMessage("buttonPushed", WBMsg(false), true);


WEBOTS_NXT_bumper theInfo= touch_data_ptr.get();
pressed= (theInfo.get_object(LEFT_TOUCH_SENSOR)).secondParameter();
