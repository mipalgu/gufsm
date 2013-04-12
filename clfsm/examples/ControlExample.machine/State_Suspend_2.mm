//
// State_Suspend_2.mm -- 2013-04-12 00:59:04 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Suspend_2.h"

#include "State_Suspend_2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Suspend_2::Suspend_2(const char *name): CLState(name, *new Suspend_2::OnEntry, *new Suspend_2::OnExit, *new Suspend_2::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Suspend_2::~Suspend_2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Suspend_2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Suspend_2_VarRefs.mm"
#	include "State_Suspend_2_OnEntry.mm"
}

void Suspend_2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Suspend_2_VarRefs.mm"
#	include "State_Suspend_2_OnExit.mm"
}

void Suspend_2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Suspend_2_VarRefs.mm"
#	include "State_Suspend_2_Internal.mm"
}

bool Suspend_2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Suspend_2_VarRefs.mm"

	return
	(
#		include "State_Suspend_2_Transition_0.expr"
	);
}

bool Suspend_2::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Suspend_2_VarRefs.mm"

	return
	(
#		include "State_Suspend_2_Transition_1.expr"
	);
}
