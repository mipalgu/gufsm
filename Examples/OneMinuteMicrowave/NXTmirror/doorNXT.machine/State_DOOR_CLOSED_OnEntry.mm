#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif

 wb.addMessage("doorOpen", WBMsg(false), true);
WEBOTS_NXT_bumper theInfo= touch_data_ptr.get();
doorOpen= !(theInfo.get_object(RIGHT_TOUCH_SENSOR)).secondParameter();
