//
// State_Update_Head.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadGoalTracker_Includes.h"
#include "SMHeadGoalTracker.h"
#include "State_Update_Head.h"

#include "State_Update_Head_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadGoalTracker;
using namespace State;

Update_Head::Update_Head(const char *name): CLState(name, *new Update_Head::OnEntry, *new Update_Head::OnExit, *new Update_Head::Internal)
{
	_transitions[0] = new Transition_0();
}

Update_Head::~Update_Head()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Update_Head::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Update_Head_VarRefs.mm"
#	include "State_Update_Head_OnEntry.mm"
}

void Update_Head::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Update_Head_VarRefs.mm"
#	include "State_Update_Head_OnExit.mm"
}

void Update_Head::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Update_Head_VarRefs.mm"
#	include "State_Update_Head_Internal.mm"
}

bool Update_Head::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadGoalTracker_VarRefs.mm"
#	include "State_Update_Head_VarRefs.mm"

	return
	(
#		include "State_Update_Head_Transition_0.expr"
	);
}
