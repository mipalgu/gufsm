float angle = (float)DEG2RAD(ballAngle);
float target_walk_angle = (float)DEG2RAD(ballAngle)/limiter;

walk_post(WALK_ControlStatus(WALK_Run, 70, 0, fabs(angle) > large_turn ? target_walk_angle/2 : target_walk_angle, 100));
