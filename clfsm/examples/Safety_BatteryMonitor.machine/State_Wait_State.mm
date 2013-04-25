//
// State_Wait_State.mm -- 2013-04-15 04:13:39 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Safety_BatteryMonitor_Includes.h"
#include "Safety_BatteryMonitor.h"
#include "State_Wait_State.h"

#include "State_Wait_State_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSafety_BatteryMonitor;
using namespace State;

Wait_State::Wait_State(const char *name): CLState(name, *new Wait_State::OnEntry, *new Wait_State::OnExit, *new Wait_State::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait_State::~Wait_State()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait_State::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Wait_State_VarRefs.mm"
#	include "State_Wait_State_OnEntry.mm"
}

void Wait_State::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Wait_State_VarRefs.mm"
#	include "State_Wait_State_OnExit.mm"
}

void Wait_State::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Wait_State_VarRefs.mm"
#	include "State_Wait_State_Internal.mm"
}

bool Wait_State::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Wait_State_VarRefs.mm"

	return
	(
#		include "State_Wait_State_Transition_0.expr"
	);
}
