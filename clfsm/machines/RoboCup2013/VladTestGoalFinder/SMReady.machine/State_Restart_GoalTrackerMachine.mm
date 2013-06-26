//
// State_Restart_GoalTrackerMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_Restart_GoalTrackerMachine.h"

#include "State_Restart_GoalTrackerMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

Restart_GoalTrackerMachine::Restart_GoalTrackerMachine(const char *name): CLState(name, *new Restart_GoalTrackerMachine::OnEntry, *new Restart_GoalTrackerMachine::OnExit, *new Restart_GoalTrackerMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

Restart_GoalTrackerMachine::~Restart_GoalTrackerMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Restart_GoalTrackerMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_OnEntry.mm"
}

void Restart_GoalTrackerMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_OnExit.mm"
}

void Restart_GoalTrackerMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_Internal.mm"
}

bool Restart_GoalTrackerMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Restart_GoalTrackerMachine_VarRefs.mm"

	return
	(
#		include "State_Restart_GoalTrackerMachine_Transition_0.expr"
	);
}
