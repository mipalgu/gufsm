
WEBOTS_NXT_bridge theInfo= touch_data_ptr.get();
if ( (TOUCH==theInfo.theInstruction()  )&& (theInfo.firstParameter()==LEFT_TOUCH_SENSOR))
     pressed= theInfo.secondParameter();
else
     pressed=false;