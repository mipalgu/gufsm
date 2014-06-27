feet = feet_ptr.get();
body = body_ptr.get();
buttonPressed = body.ChestBoard_Button() || (feet.LFoot_Bumper_Left() && feet.LFoot_Bumper_Right()) || (feet.RFoot_Bumper_Left() && feet.RFoot_Bumper_Right());
buttonReleased = !body.ChestBoard_Button() && !feet.LFoot_Bumper_Left() && !feet.LFoot_Bumper_Right() && !feet.RFoot_Bumper_Left() && !feet.RFoot_Bumper_Right();

say("Cheese!");

torso = torso_ptr.get();
legs = leg_ptr.get();

cout
 <<  torso.HeadYaw() << ", "
 <<  torso.HeadPitch()  << ", "
 <<  torso.LShoulderPitch() << ", "
 <<  torso.LShoulderRoll()  << ", "
 <<  torso.LElbowYaw()  << ", "
 <<  torso.LElbowRoll() << ", "
 <<  legs.LHipYawPitch() << ", "
 <<  legs.LHipRoll() << ", "
 <<  legs.LHipPitch() << ", "
 <<  legs.LKneePitch() << ", "
 <<  legs.LAnklePitch() << ", "
 <<  legs.LAnkleRoll() << ", "
 <<  legs.RHipYawPitch() << ", "
 <<  legs.RHipRoll() << ", "
 <<  legs.RHipPitch() << ", "
 <<  legs.RKneePitch() << ", "
 <<  legs.RAnklePitch() << ", "
 <<  legs.RAnkleRoll() << ", "
 <<  torso.RShoulderPitch() << ", "
 <<  torso.RShoulderRoll() << ", "
 <<  torso.RElbowYaw() << ", "
 <<  torso.RElbowRoll()
 << endl;

snapshotNumber++;
snapshotTime += 0.5;
