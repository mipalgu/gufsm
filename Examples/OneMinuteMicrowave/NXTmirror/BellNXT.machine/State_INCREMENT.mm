//
// State_INCREMENT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BellNXT_Includes.h"
#include "BellNXT.h"
#include "State_INCREMENT.h"

#include "State_INCREMENT_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBellNXT;
using namespace State;

INCREMENT::INCREMENT(const char *name): CLState(name, *new INCREMENT::OnEntry, *new INCREMENT::OnExit, *new INCREMENT::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

INCREMENT::~INCREMENT()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void INCREMENT::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_INCREMENT_VarRefs.mm"
#	include "State_INCREMENT_OnEntry.mm"
}

void INCREMENT::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_INCREMENT_VarRefs.mm"
#	include "State_INCREMENT_OnExit.mm"
}

void INCREMENT::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_INCREMENT_VarRefs.mm"
#	include "State_INCREMENT_Internal.mm"
}

bool INCREMENT::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_INCREMENT_VarRefs.mm"

	return
	(
#		include "State_INCREMENT_Transition_0.expr"
	);
}

bool INCREMENT::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_INCREMENT_VarRefs.mm"

	return
	(
#		include "State_INCREMENT_Transition_1.expr"
	);
}
