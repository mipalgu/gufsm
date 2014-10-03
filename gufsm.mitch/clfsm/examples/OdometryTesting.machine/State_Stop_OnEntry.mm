std::cout << "Stop" << std::endl;
Odometry odo = { 0, 0, 0};
WALK_ControlStatus control(WALK_Stop, 0, 0, 0, 0);
control.set_odometry(odo);
control.set_odometry_mask(false);
walk_post(control);
speak("Stop");
cout << odo_forward << endl;
