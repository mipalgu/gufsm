//
// State_Start_GoalTrackerMachine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_Start_GoalTrackerMachine.h"

#include "State_Start_GoalTrackerMachine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

Start_GoalTrackerMachine::Start_GoalTrackerMachine(const char *name): CLState(name, *new Start_GoalTrackerMachine::OnEntry, *new Start_GoalTrackerMachine::OnExit, *new Start_GoalTrackerMachine::Internal)
{
	_transitions[0] = new Transition_0();
}

Start_GoalTrackerMachine::~Start_GoalTrackerMachine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Start_GoalTrackerMachine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_OnEntry.mm"
}

void Start_GoalTrackerMachine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_OnExit.mm"
}

void Start_GoalTrackerMachine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_Internal.mm"
}

bool Start_GoalTrackerMachine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Start_GoalTrackerMachine_VarRefs.mm"

	return
	(
#		include "State_Start_GoalTrackerMachine_Transition_0.expr"
	);
}
