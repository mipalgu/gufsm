FilteredGoalSighting_t goals_ptr;
FilteredOneDimObjects goals = goals_ptr.get();

for (FilteredVisionObjectType i = FVOGoalCrossBar; i >= FVOGoalPost; i=(FilteredVisionObjectType)((int)i-1))
{
    goal = goals.get_object(i);	
	goal_index = i;
    if(goal.isVisible())
        break;
}
