int speed = 100*(lineY-LINE_Y_DIST)/(RES-LINE_Y_DIST);
if(speed > 100)
	speed = 100;
walk_ptr(WALK_ControlStatus(WALK_Run, 100, -8, 0, speed));
