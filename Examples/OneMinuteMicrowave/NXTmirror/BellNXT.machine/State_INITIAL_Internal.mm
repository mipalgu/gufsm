
WBMsg test =wb.getMessage("sound");
if (test.getType()==WBMsg::TypeInt)
   bellSignal=test.getIntValue();
