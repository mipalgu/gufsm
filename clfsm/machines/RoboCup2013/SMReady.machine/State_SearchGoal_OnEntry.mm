restart("SMHeadGoalTracker");

theObjects = theObjectp.get();
WbGoalPostInfo* lp = theObjects.LeftGoalPost();
WbGoalPostInfo* rp = theObjects.RightGoalPost();


visionSeesLP = (NULL != lp);

visionSeesRP =  (NULL != rp);
