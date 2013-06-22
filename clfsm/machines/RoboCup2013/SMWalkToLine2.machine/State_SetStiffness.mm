//
// State_SetStiffness.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkToLine2_Includes.h"
#include "SMWalkToLine2.h"
#include "State_SetStiffness.h"

#include "State_SetStiffness_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkToLine2;
using namespace State;

SetStiffness::SetStiffness(const char *name): CLState(name, *new SetStiffness::OnEntry, *new SetStiffness::OnExit, *new SetStiffness::Internal)
{
	_transitions[0] = new Transition_0();
}

SetStiffness::~SetStiffness()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetStiffness::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetStiffness_VarRefs.mm"
#	include "State_SetStiffness_OnEntry.mm"
}

void SetStiffness::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetStiffness_VarRefs.mm"
#	include "State_SetStiffness_OnExit.mm"
}

void SetStiffness::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetStiffness_VarRefs.mm"
#	include "State_SetStiffness_Internal.mm"
}

bool SetStiffness::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetStiffness_VarRefs.mm"

	return
	(
#		include "State_SetStiffness_Transition_0.expr"
	);
}
