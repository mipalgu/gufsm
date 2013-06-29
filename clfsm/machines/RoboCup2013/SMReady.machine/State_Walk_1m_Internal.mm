status = walk_status();
currentOdometry = status.odometry().forward;

DBG(cout << (currentOdometry - walkStartOdometry) << endl);
