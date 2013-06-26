status = walk_status();
currentOdometry = status.odometry(). turn;

DBG(cout << (currentOdometry - walkStartOdometry) << endl);
