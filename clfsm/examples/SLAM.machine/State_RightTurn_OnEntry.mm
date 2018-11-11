std::cout << "RightTurn" << std::endl;
//SayMsg("Right Turn");

//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, 10, 0));
WalkMsg(NaoWalkCommand().walk(0, 0, 10 ));
