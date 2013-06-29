walk_post(WALK_ControlStatus(WALK_Run, 0, 0, (float)DEG2RAD(10.0f), 100)); 


controlstatus = walk_status();
odo_turn = controlstatus.odometry().turn;
odo_start = odo_turn;
odo_diff = 0.0f;
