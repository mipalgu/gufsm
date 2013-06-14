theObjects = theObjectp.get();
WbGoalPostInfo* lp = theObjects.LeftGoalPost();
WbGoalPostInfo* rp = theObjects.RightGoalPost();


if(NULL != lp)
	visionSeesLP = true;
else visionSeesLP = false;
if(NULL != rp)
	visionSeesRP = true;
else visionSeesRP = false;

std::cout << visionSeesLP << "-" << visionSeesRP << std::endl;
