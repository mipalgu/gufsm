restart("SMHeadScannerGoal");

//theObjects = theObjectp.get();
//WbGoalPostInfo* lp = theObjects.LeftGoalPost();
//WbGoalPostInfo* rp = theObjects.RightGoalPost();


//visionSeesLP = (NULL != lp);

//visionSeesRP =  (NULL != rp);

rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);

std::cerr << rightPost.isVisible() << " " << leftPost.isVisible()<< " are visible?" << std::endl;
