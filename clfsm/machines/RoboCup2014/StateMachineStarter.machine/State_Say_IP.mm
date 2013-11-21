//
// State_Say_IP.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Say_IP.h"

#include "State_Say_IP_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Say_IP::Say_IP(const char *name): CLState(name, *new Say_IP::OnEntry, *new Say_IP::OnExit, *new Say_IP::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Say_IP::~Say_IP()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Say_IP::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Say_IP_VarRefs.mm"
#	include "State_Say_IP_OnEntry.mm"
}

void Say_IP::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Say_IP_VarRefs.mm"
#	include "State_Say_IP_OnExit.mm"
}

void Say_IP::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Say_IP_VarRefs.mm"
#	include "State_Say_IP_Internal.mm"
}

bool Say_IP::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Say_IP_VarRefs.mm"

	return
	(
#		include "State_Say_IP_Transition_0.expr"
	);
}

bool Say_IP::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Say_IP_VarRefs.mm"

	return
	(
#		include "State_Say_IP_Transition_1.expr"
	);
}
