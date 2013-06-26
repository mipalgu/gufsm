//
// State_Stiffness.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_Stiffness.h"

#include "State_Stiffness_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

Stiffness::Stiffness(const char *name): CLState(name, *new Stiffness::OnEntry, *new Stiffness::OnExit, *new Stiffness::Internal)
{
	_transitions[0] = new Transition_0();
}

Stiffness::~Stiffness()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Stiffness::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Stiffness_VarRefs.mm"
#	include "State_Stiffness_OnEntry.mm"
}

void Stiffness::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Stiffness_VarRefs.mm"
#	include "State_Stiffness_OnExit.mm"
}

void Stiffness::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Stiffness_VarRefs.mm"
#	include "State_Stiffness_Internal.mm"
}

bool Stiffness::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Stiffness_VarRefs.mm"

	return
	(
#		include "State_Stiffness_Transition_0.expr"
	);
}
