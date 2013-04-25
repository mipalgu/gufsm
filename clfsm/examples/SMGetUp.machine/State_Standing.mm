//
// State_Standing.mm -- 2013-04-18 04:16:13 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_Standing.h"

#include "State_Standing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

Standing::Standing(const char *name): CLState(name, *new Standing::OnEntry, *new Standing::OnExit, *new Standing::Internal)
{
	_transitions[0] = new Transition_0();
}

Standing::~Standing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Standing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_OnEntry.mm"
}

void Standing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_OnExit.mm"
}

void Standing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_Internal.mm"
}

bool Standing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"

	return
	(
#		include "State_Standing_Transition_0.expr"
	);
}
