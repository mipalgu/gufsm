//
// State_State_3.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "MultiMachine_Includes.h"
#include "MultiMachine.h"
#include "State_State_3.h"

#include "State_State_3_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMultiMachine;
using namespace State;

State_3::State_3(const char *name): CLState(name, *new State_3::OnEntry, *new State_3::OnExit, *new State_3::Internal)
{
	_transitions[0] = new Transition_0();
}

State_3::~State_3()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void State_3::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "State_State_3_OnEntry.mm"
}

void State_3::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "State_State_3_OnExit.mm"
}

void State_3::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"
#	include "State_State_3_Internal.mm"
}

bool State_3::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_State_3_VarRefs.mm"

	return
	(
#		include "State_State_3_Transition_0.expr"
	);
}
