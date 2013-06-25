#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

double player_spacing = 100.0;
double goal_centre = 300.0;

playerNumber = wb_player_number.get();
status = walk_status();

headDelayInUS = 250000;
headAngleX = M_PI/2 - atan(goal_centre / (    ((player_spacing * playerNumber) + player_spacing) /2.0)   );

if (playerNumber % 2 == 0) headAngleX = -headAngleX;

cout << "head for player " << playerNumber << " moving to " << RAD2DEG(headAngleX) << " degrees " << endl;

suspend("SMHeadGoalTracker");

ballAngle = 0;
min_long_distance_angle = 15;
min_short_distance_angle = 15;
boundaryCloseFar = 200; //cm
