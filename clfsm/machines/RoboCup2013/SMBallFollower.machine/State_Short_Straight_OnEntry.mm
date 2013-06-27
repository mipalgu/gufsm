float wantedSpeed = float(fminf(20.0f+7.0f*float(ball.distance())/float(limiter), 50.0f));
forwardSpeed = (0.875f*forwardSpeed + 0.125f*wantedSpeed)> forwardSpeed ? forwardSpeed : 0.875f*forwardSpeed + 0.125f*wantedSpeed ;

walk_post(WALK_ControlStatus(WALK_Run, forwardSpeed, 0, 0, 50));
