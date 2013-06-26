suspend("SMHeadGoalTracker");

theObjects = theObjectp.get();
WbGoalPostInfo* lp = theObjects.LeftGoalPost();
WbGoalPostInfo* rp = theObjects.RightGoalPost();


visionSeesLP = (NULL != lp);

visionSeesRP =  (NULL != rp);


rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);


if(walk_status.get().controlStatus() != WALK_Disconnected)
{
	walk_post(WALK_Stop);
}
