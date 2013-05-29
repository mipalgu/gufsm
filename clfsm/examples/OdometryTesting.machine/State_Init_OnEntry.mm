#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

std::cout << "Odometry State machine" << std::endl;
fullSpeed = 100;
halfSpeed = fullSpeed/2;
currentSpeed = fullSpeed;

Odometry odo = { 0, 0, 0};
WALK_ControlStatus control(WALK_Stop, 0, 0, 0, 0);
control.set_odometry(odo);
control.set_odometry_mask(true);
walk_post(control);
odo_forward=1; //Initialize variables here if they are in Internal
