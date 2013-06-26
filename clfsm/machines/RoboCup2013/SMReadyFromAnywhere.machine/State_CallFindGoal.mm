//
// State_CallFindGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_CallFindGoal.h"

#include "State_CallFindGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

CallFindGoal::CallFindGoal(const char *name): CLState(name, *new CallFindGoal::OnEntry, *new CallFindGoal::OnExit, *new CallFindGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

CallFindGoal::~CallFindGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void CallFindGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CallFindGoal_VarRefs.mm"
#	include "State_CallFindGoal_OnEntry.mm"
}

void CallFindGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CallFindGoal_VarRefs.mm"
#	include "State_CallFindGoal_OnExit.mm"
}

void CallFindGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CallFindGoal_VarRefs.mm"
#	include "State_CallFindGoal_Internal.mm"
}

bool CallFindGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CallFindGoal_VarRefs.mm"

	return
	(
#		include "State_CallFindGoal_Transition_0.expr"
	);
}
