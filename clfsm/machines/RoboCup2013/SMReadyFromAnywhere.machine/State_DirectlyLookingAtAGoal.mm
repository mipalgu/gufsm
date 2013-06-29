//
// State_DirectlyLookingAtAGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_DirectlyLookingAtAGoal.h"

#include "State_DirectlyLookingAtAGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

DirectlyLookingAtAGoal::DirectlyLookingAtAGoal(const char *name): CLState(name, *new DirectlyLookingAtAGoal::OnEntry, *new DirectlyLookingAtAGoal::OnExit, *new DirectlyLookingAtAGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

DirectlyLookingAtAGoal::~DirectlyLookingAtAGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DirectlyLookingAtAGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_OnEntry.mm"
}

void DirectlyLookingAtAGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_OnExit.mm"
}

void DirectlyLookingAtAGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_Internal.mm"
}

bool DirectlyLookingAtAGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DirectlyLookingAtAGoal_VarRefs.mm"

	return
	(
#		include "State_DirectlyLookingAtAGoal_Transition_0.expr"
	);
}
