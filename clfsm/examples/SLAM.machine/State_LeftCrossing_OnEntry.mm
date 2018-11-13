std::cout << "LeftCrossing" << std::endl;
SayMsg("Left Crossing Detected");

//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, 0, 0));
WalkMsg(NaoWalkCommand().walk(100, 0, 0 ));
