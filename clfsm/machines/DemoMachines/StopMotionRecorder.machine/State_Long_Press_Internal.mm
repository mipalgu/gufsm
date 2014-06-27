feet = feet_ptr.get();
body = body_ptr.get();
buttonPressed = body.ChestBoard_Button() || (feet.LFoot_Bumper_Left() && feet.LFoot_Bumper_Right()) || (feet.RFoot_Bumper_Left() && feet.RFoot_Bumper_Right());
buttonReleased = !body.ChestBoard_Button() && !feet.LFoot_Bumper_Left() && !feet.LFoot_Bumper_Right() && !feet.RFoot_Bumper_Left() && !feet.RFoot_Bumper_Right();
