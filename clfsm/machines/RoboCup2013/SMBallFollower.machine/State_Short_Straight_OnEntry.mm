float wantedSpeed = float(fminf(20.0f+7.0f*float(ball.distance())/float(limiter), 50.0f));
forwardSpeed = (0.98*forwardSpeed + 0.02*wantedSpeed)> forwardSpeed ? forwardSpeed : 0.98*forwardSpeed + 0.02*wantedSpeed ;

walk_post(WALK_ControlStatus(WALK_Run, forwardSpeed, 0, 0, 50));
