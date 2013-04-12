//
// State_GC_Running.mm -- 2013-04-12 03:22:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_GC_Running.h"

#include "State_GC_Running_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

GC_Running::GC_Running(const char *name): CLState(name, *new GC_Running::OnEntry, *new GC_Running::OnExit, *new GC_Running::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

GC_Running::~GC_Running()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void GC_Running::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_GC_Running_VarRefs.mm"
#	include "State_GC_Running_OnEntry.mm"
}

void GC_Running::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_GC_Running_VarRefs.mm"
#	include "State_GC_Running_OnExit.mm"
}

void GC_Running::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_GC_Running_VarRefs.mm"
#	include "State_GC_Running_Internal.mm"
}

bool GC_Running::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_GC_Running_VarRefs.mm"

	return
	(
#		include "State_GC_Running_Transition_0.expr"
	);
}

bool GC_Running::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_GC_Running_VarRefs.mm"

	return
	(
#		include "State_GC_Running_Transition_1.expr"
	);
}
