//
// State_Alt_Test_State.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Alt_Test_State.h"

#include "State_Alt_Test_State_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Alt_Test_State::Alt_Test_State(const char *name): CLState(name, *new Alt_Test_State::OnEntry, *new Alt_Test_State::OnExit, *new Alt_Test_State::Internal)
{
	_transitions[0] = new Transition_0();
}

Alt_Test_State::~Alt_Test_State()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Alt_Test_State::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Alt_Test_State_VarRefs.mm"
#	include "State_Alt_Test_State_OnEntry.mm"
}

void Alt_Test_State::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Alt_Test_State_VarRefs.mm"
#	include "State_Alt_Test_State_OnExit.mm"
}

void Alt_Test_State::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Alt_Test_State_VarRefs.mm"
#	include "State_Alt_Test_State_Internal.mm"
}

bool Alt_Test_State::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Alt_Test_State_VarRefs.mm"

	return
	(
#		include "State_Alt_Test_State_Transition_0.expr"
	);
}
