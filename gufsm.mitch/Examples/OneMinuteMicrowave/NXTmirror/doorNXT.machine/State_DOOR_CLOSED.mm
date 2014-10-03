//
// State_DOOR_CLOSED.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "doorNXT_Includes.h"
#include "doorNXT.h"
#include "State_DOOR_CLOSED.h"

#include "State_DOOR_CLOSED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMdoorNXT;
using namespace State;

DOOR_CLOSED::DOOR_CLOSED(const char *name): CLState(name, *new DOOR_CLOSED::OnEntry, *new DOOR_CLOSED::OnExit, *new DOOR_CLOSED::Internal)
{
	_transitions[0] = new Transition_0();
}

DOOR_CLOSED::~DOOR_CLOSED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DOOR_CLOSED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_CLOSED_VarRefs.mm"
#	include "State_DOOR_CLOSED_OnEntry.mm"
}

void DOOR_CLOSED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_CLOSED_VarRefs.mm"
#	include "State_DOOR_CLOSED_OnExit.mm"
}

void DOOR_CLOSED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_CLOSED_VarRefs.mm"
#	include "State_DOOR_CLOSED_Internal.mm"
}

bool DOOR_CLOSED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_CLOSED_VarRefs.mm"

	return
	(
#		include "State_DOOR_CLOSED_Transition_0.expr"
	);
}
