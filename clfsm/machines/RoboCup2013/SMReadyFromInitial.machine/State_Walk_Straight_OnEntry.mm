status = walk_status();
currentOdometry = status.odometry().forward;
walkStartOdometry = currentOdometry;
walk_post(WALK_ControlStatus(WALK_Run,100,0,0,100));
