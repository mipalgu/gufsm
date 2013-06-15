status = walk_status();
currentOdometry = status.odometry().turn;
walkStartOdometry = currentOdometry;
walk_post(WALK_ControlStatus(WALK_Run,0,0,M_PI/4.0,100));
