//
// State_Wait.mm -- 2013-04-12 00:59:04 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Wait.h"

#include "State_Wait_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Wait::Wait(const char *name): CLState(name, *new Wait::OnEntry, *new Wait::OnExit, *new Wait::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait::~Wait()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "State_Wait_OnEntry.mm"
}

void Wait::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "State_Wait_OnExit.mm"
}

void Wait::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"
#	include "State_Wait_Internal.mm"
}

bool Wait::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Wait_VarRefs.mm"

	return
	(
#		include "State_Wait_Transition_0.expr"
	);
}
