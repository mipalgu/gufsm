status = walk_status();
currentOdometry = status.odometry().turn;
walkStartOdometry = currentOdometry;
float angle = float ((theHeadYaw>0)? DEG2RAD(5.0f) : DEG2RAD(-5.0f) );

walk_post(WALK_ControlStatus(WALK_Run, 0, 0, angle, 100));
suspend("SMHeadScannerGoal");

theObjects = theObjectp.get();
WbGoalPostInfo* lp = theObjects.LeftGoalPost();
WbGoalPostInfo* rp = theObjects.RightGoalPost();


visionSeesLP = (NULL != lp);

visionSeesRP =  (NULL != rp);
rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
