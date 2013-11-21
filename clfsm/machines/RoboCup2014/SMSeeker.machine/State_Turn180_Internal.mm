controlstatus = walk_status();
odo_turn = controlstatus.odometry().turn;
odo_diff = odo_turn - odo_start;
while (odo_diff < 0) odo_diff += float(2*M_PI);
while (odo_diff >= 2*M_PI) odo_diff -= float(2*M_PI);
