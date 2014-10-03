WBMsg test =wb.getMessage("light");
if (test.getType()==WBMsg::TypeInt)
   lightSignal=test.getIntValue();
