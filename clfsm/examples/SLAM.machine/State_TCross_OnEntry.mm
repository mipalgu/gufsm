std::cout << "TCross" << std::endl;
SayMsg("Tea Crossing Detected");

//WalkMsg(WALK2014_ControlStatus(WALK, 95, 0, 10, 0));
WalkMsg(NaoWalkCommand().walk(95, 0, 10));
