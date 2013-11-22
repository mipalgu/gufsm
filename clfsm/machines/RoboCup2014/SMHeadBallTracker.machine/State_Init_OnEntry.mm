#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

time = 100000;
counter = 0;

	/*
	extern BallDistance;
	extern guvision_width;
	extern guvision_height;
	extern horiz_fov;
	extern vertical_fov;
	extern zPos;
	extern yPos;
	extern track_smoothness;
	extern dist_factor;
	extern x_per_cm_dist;
	extern y_per_cm_dist;
	extern tx;
	extern ty;

	int originalZ; 
	int originalY; 
	int headPitch; int doLeft; int ball_x; int ball_y; int dy; int my; int period; int fx; int fy; int fs; int update; int mx; int dx; int doLowBottomSeek; int targetAngle; int lowerSeek; int minMove;
	period=100000; 
        fx=5*guvision_width/4; 
        fy=guvision_height/24;
        fs=10240/guvision_width; 
        minMove = guvision_width/160; 
        headSeekSpeed=2;

	originalZ = 0;
	originalY = 0;
	zPos = 0;
	yPos = 0;
	delay = 100000;
	track_smoothness = 4;
	dist_factor = 50; 
	FIXED_FACTOR = 100; 

*/
