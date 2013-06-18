//
// State_Goal_Approach.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_Goal_Approach.h"

#include "State_Goal_Approach_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

Goal_Approach::Goal_Approach(const char *name): CLState(name, *new Goal_Approach::OnEntry, *new Goal_Approach::OnExit, *new Goal_Approach::Internal)
{
}

Goal_Approach::~Goal_Approach()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Goal_Approach::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Goal_Approach_VarRefs.mm"
#	include "State_Goal_Approach_OnEntry.mm"
}

void Goal_Approach::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Goal_Approach_VarRefs.mm"
#	include "State_Goal_Approach_OnExit.mm"
}

void Goal_Approach::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_Goal_Approach_VarRefs.mm"
#	include "State_Goal_Approach_Internal.mm"
}
