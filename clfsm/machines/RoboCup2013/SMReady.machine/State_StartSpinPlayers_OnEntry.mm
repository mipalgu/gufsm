status = walk_status();
currentOdometry = status.odometry().turn;
walkStartOdometry = currentOdometry;
float sign = (playerNumber %2) ? -1.0f : 1.0f ; // odd robots not the go lie spin the other way

walk_post(WALK_ControlStatus(WALK_Run, 0, 0, (float)DEG2RAD(sign*10.0f), 100));
