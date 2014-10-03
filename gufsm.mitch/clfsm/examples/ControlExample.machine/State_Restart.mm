//
// State_Restart.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Restart.h"

#include "State_Restart_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMControlExample;
using namespace State;

Restart::Restart(const char *name): CLState(name, *new Restart::OnEntry, *new Restart::OnExit, *new Restart::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Restart::~Restart()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Restart::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_OnEntry.mm"
}

void Restart::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_OnExit.mm"
}

void Restart::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_Internal.mm"
}

bool Restart::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"

	return
	(
#		include "State_Restart_Transition_0.expr"
	);
}

bool Restart::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"

	return
	(
#		include "State_Restart_Transition_1.expr"
	);
}
