stateCount++;

FilteredGoalSighting_t goals_ptr;
FilteredOneDimObjects goals = goals_ptr.get();

for (FilteredVisionObjectType i = FVOGoalCrossBar; i >= FVOGoalPost; i--)
{
    goal = goals.get_object(i);	
    if(goal.isVisible())
        break;
}
