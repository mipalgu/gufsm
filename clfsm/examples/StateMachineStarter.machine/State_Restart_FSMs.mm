//
// State_Restart_FSMs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Restart_FSMs.h"

#include "State_Restart_FSMs_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Restart_FSMs::Restart_FSMs(const char *name): CLState(name, *new Restart_FSMs::OnEntry, *new Restart_FSMs::OnExit, *new Restart_FSMs::Internal)
{
	_transitions[0] = new Transition_0();
}

Restart_FSMs::~Restart_FSMs()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Restart_FSMs::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Restart_FSMs_VarRefs.mm"
#	include "State_Restart_FSMs_OnEntry.mm"
}

void Restart_FSMs::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Restart_FSMs_VarRefs.mm"
#	include "State_Restart_FSMs_OnExit.mm"
}

void Restart_FSMs::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Restart_FSMs_VarRefs.mm"
#	include "State_Restart_FSMs_Internal.mm"
}

bool Restart_FSMs::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Restart_FSMs_VarRefs.mm"

	return
	(
#		include "State_Restart_FSMs_Transition_0.expr"
	);
}
