status = walk_status();
currentOdometry = status.odometry().turn;
walkStartOdometry = currentOdometry;
angle = float ((theHeadYaw>0)? DEG2RAD(5.0f) : DEG2RAD(-5.0f) );

walk_post(WALK_ControlStatus(WALK_Run, 0, 0, angle, 100));
