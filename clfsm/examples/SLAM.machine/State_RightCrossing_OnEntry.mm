std::cout << "RightCrossing" << std::endl;
SayMsg("Right Crossing Detected");

//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, 0, 0));
WalkMsg(NaoWalkCommand().walk(100, 0, 0 ));
