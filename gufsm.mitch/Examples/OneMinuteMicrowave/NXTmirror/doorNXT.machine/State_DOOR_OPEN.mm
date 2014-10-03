//
// State_DOOR_OPEN.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "doorNXT_Includes.h"
#include "doorNXT.h"
#include "State_DOOR_OPEN.h"

#include "State_DOOR_OPEN_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMdoorNXT;
using namespace State;

DOOR_OPEN::DOOR_OPEN(const char *name): CLState(name, *new DOOR_OPEN::OnEntry, *new DOOR_OPEN::OnExit, *new DOOR_OPEN::Internal)
{
	_transitions[0] = new Transition_0();
}

DOOR_OPEN::~DOOR_OPEN()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DOOR_OPEN::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_OPEN_VarRefs.mm"
#	include "State_DOOR_OPEN_OnEntry.mm"
}

void DOOR_OPEN::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_OPEN_VarRefs.mm"
#	include "State_DOOR_OPEN_OnExit.mm"
}

void DOOR_OPEN::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_OPEN_VarRefs.mm"
#	include "State_DOOR_OPEN_Internal.mm"
}

bool DOOR_OPEN::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "doorNXT_VarRefs.mm"
#	include "State_DOOR_OPEN_VarRefs.mm"

	return
	(
#		include "State_DOOR_OPEN_Transition_0.expr"
	);
}
