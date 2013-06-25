feet = feet_ptr.get();
body = body_ptr.get();
buttonPressed = body.ChestBoard_Button() || (feet.LFoot_Bumper_Left() && feet.LFoot_Bumper_Right()) || (feet.RFoot_Bumper_Left() && feet.RFoot_Bumper_Right());
buttonReleased = !body.ChestBoard_Button() && !feet.LFoot_Bumper_Left() && !feet.LFoot_Bumper_Right() && !feet.RFoot_Bumper_Left() && !feet.RFoot_Bumper_Right();

say("Cheese!");

torso = torso_ptr.get();
legs = leg_ptr.get();

cout <<
"times[0][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[0][" << snapshotNumber << "] = " <<  torso.LShoulderPitch() << ";\n"
"times[1][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[1][" << snapshotNumber << "] = " <<  torso.LShoulderRoll() << ";\n"
"times[2][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[2][" << snapshotNumber << "] = " <<  torso.LElbowYaw() << ";\n"
"times[3][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[3][" << snapshotNumber << "] = " <<  torso.LElbowRoll() << ";\n"
"times[4][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[4][" << snapshotNumber << "] = " <<  0 /*torso.LWristYaw()*/ << ";\n"
"times[5][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[5][" << snapshotNumber << "] = " <<  0 /*torso.LHand()*/ << ";\n"
"times[6][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[6][" << snapshotNumber << "] = " <<  torso.RShoulderPitch() << ";\n"
"times[7][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[7][" << snapshotNumber << "] = " <<  torso.RShoulderRoll() << ";\n"
"times[8][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[8][" << snapshotNumber << "] = " <<  torso.RElbowYaw() << ";\n"
"times[9][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[9][" << snapshotNumber << "] = " <<  torso.RElbowRoll() << ";\n"
"times[10][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[10][" << snapshotNumber << "] = " <<  0 /*torso.RWristYaw()*/ << ";\n"
"times[11][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[11][" << snapshotNumber << "] = " <<  0 /*torso.RHand()*/ << ";\n"
"times[12][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[12][" << snapshotNumber << "] = " <<  legs.LHipYawPitch() << ";\n"
"times[13][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[13][" << snapshotNumber << "] = " <<  legs.LHipRoll() << ";\n"
"times[14][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[14][" << snapshotNumber << "] = " <<  legs.LHipPitch() << ";\n"
"times[15][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[15][" << snapshotNumber << "] = " <<  legs.LKneePitch() << ";\n"
"times[16][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[16][" << snapshotNumber << "] = " <<  legs.LAnklePitch() << ";\n"
"times[17][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[17][" << snapshotNumber << "] = " <<  legs.LAnkleRoll() << ";\n"
"times[18][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[18][" << snapshotNumber << "] = " <<  legs.RHipRoll() << ";\n"
"times[19][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[19][" << snapshotNumber << "] = " <<  legs.RHipPitch() << ";\n"
"times[20][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[20][" << snapshotNumber << "] = " <<  legs.RKneePitch() << ";\n"
"times[21][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[21][" << snapshotNumber << "] = " <<  legs.RAnklePitch() << ";\n"
"times[22][" << snapshotNumber << "] = " << snapshotTime << ";\n"
"keys[22][" << snapshotNumber << "] = " <<  legs.RAnkleRoll() << ";\n" << endl;

snapshotNumber++;
snapshotTime += 0.5;
