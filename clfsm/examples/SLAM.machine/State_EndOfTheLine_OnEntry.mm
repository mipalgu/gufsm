//std::cout << "EndOfTheLine" << std::endl;
//SayMsg("End Of The Line Found");
HeadMsg.set(HeadTrg);

//WalkMsg(WALK2014_ControlStatus(WALK, 0, 0, 0, 0));
WalkMsg(NaoWalkCommand().stop());
