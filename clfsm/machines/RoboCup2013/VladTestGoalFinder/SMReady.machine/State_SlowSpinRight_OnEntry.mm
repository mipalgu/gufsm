status = walk_status();
currentOdometry = status.odometry().turn;
walkStartOdometry = currentOdometry;

walk_post(WALK_ControlStatus(WALK_Run, 0, 0, (float)DEG2RAD(-5.0f), 100));
