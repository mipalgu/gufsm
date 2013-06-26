restart("SMHeadGoalTracker");
Odometry odo = { 0, 0, 0};
WALK_ControlStatus control(WALK_Stop, 0, 0, 0, 0);
control.set_odometry(odo);
control.set_odometry_mask(true);
walk_post(control);
