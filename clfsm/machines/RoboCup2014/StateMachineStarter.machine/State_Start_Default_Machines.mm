//
// State_Start_Default_Machines.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Start_Default_Machines.h"

#include "State_Start_Default_Machines_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Start_Default_Machines::Start_Default_Machines(const char *name): CLState(name, *new Start_Default_Machines::OnEntry, *new Start_Default_Machines::OnExit, *new Start_Default_Machines::Internal)
{
	_transitions[0] = new Transition_0();
}

Start_Default_Machines::~Start_Default_Machines()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Start_Default_Machines::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_Default_Machines_VarRefs.mm"
#	include "State_Start_Default_Machines_OnEntry.mm"
}

void Start_Default_Machines::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_Default_Machines_VarRefs.mm"
#	include "State_Start_Default_Machines_OnExit.mm"
}

void Start_Default_Machines::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_Default_Machines_VarRefs.mm"
#	include "State_Start_Default_Machines_Internal.mm"
}

bool Start_Default_Machines::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_Default_Machines_VarRefs.mm"

	return
	(
#		include "State_Start_Default_Machines_Transition_0.expr"
	);
}
