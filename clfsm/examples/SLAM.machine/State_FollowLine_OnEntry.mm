//std::cout << "FollowLine" << std::endl;
//SayMsg("Line Found");
HeadMsg.set(HeadTrg);
WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, static_cast<int>(((LineMsg & 1023) - 320)/5), 0));
