//
// State_DummyState.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_DummyState.h"

#include "State_DummyState_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

DummyState::DummyState(const char *name): CLState(name, *new DummyState::OnEntry, *new DummyState::OnExit, *new DummyState::Internal)
{
	_transitions[0] = new Transition_0();
}

DummyState::~DummyState()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DummyState::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_DummyState_VarRefs.mm"
#	include "State_DummyState_OnEntry.mm"
}

void DummyState::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_DummyState_VarRefs.mm"
#	include "State_DummyState_OnExit.mm"
}

void DummyState::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_DummyState_VarRefs.mm"
#	include "State_DummyState_Internal.mm"
}

bool DummyState::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_DummyState_VarRefs.mm"

	return
	(
#		include "State_DummyState_Transition_0.expr"
	);
}
