//
// State_INITIAL.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "doorNXT_Includes.h"
#include "doorNXT.h"
#include "State_INITIAL.h"

#include "State_INITIAL_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMdoorNXT;
using namespace State;

INITIAL::INITIAL(const char *name): CLState(name, *new INITIAL::OnEntry, *new INITIAL::OnExit, *new INITIAL::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

INITIAL::~INITIAL()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void INITIAL::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_OnEntry.mm"
}

void INITIAL::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_OnExit.mm"
}

void INITIAL::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"
#	include "State_INITIAL_Internal.mm"
}

bool INITIAL::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"

	return
	(
#		include "State_INITIAL_Transition_0.expr"
	);
}

bool INITIAL::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_INITIAL_VarRefs.mm"

	return
	(
#		include "State_INITIAL_Transition_1.expr"
	);
}
