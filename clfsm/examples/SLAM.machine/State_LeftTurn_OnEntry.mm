std::cout << "LeftTurn" << std::endl;
//SayMsg("Left Turn Detected");

//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, -10, 0));
WalkMsg(NaoWalkCommand().walk(0, 0, -10 ));
