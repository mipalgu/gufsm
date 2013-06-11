//
// State_Suspending.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"
#include "State_Suspending.h"

#include "State_Suspending_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayerGoal;
using namespace State;

Suspending::Suspending(const char *name): CLState(name, *new Suspending::OnEntry, *new Suspending::OnExit, *new Suspending::Internal)
{
	_transitions[0] = new Transition_0();
}

Suspending::~Suspending()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Suspending::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_VarRefs.mm"
#	include "State_Suspending_OnEntry.mm"
}

void Suspending::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_VarRefs.mm"
#	include "State_Suspending_OnExit.mm"
}

void Suspending::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_VarRefs.mm"
#	include "State_Suspending_Internal.mm"
}

bool Suspending::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_VarRefs.mm"

	return
	(
#		include "State_Suspending_Transition_0.expr"
	);
}
