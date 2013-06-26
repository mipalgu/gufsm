//
// State_SlowSpinLeft.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_SlowSpinLeft.h"

#include "State_SlowSpinLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

SlowSpinLeft::SlowSpinLeft(const char *name): CLState(name, *new SlowSpinLeft::OnEntry, *new SlowSpinLeft::OnExit, *new SlowSpinLeft::Internal)
{
	_transitions[0] = new Transition_0();
}

SlowSpinLeft::~SlowSpinLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SlowSpinLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_SlowSpinLeft_VarRefs.mm"
#	include "State_SlowSpinLeft_OnEntry.mm"
}

void SlowSpinLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_SlowSpinLeft_VarRefs.mm"
#	include "State_SlowSpinLeft_OnExit.mm"
}

void SlowSpinLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_SlowSpinLeft_VarRefs.mm"
#	include "State_SlowSpinLeft_Internal.mm"
}

bool SlowSpinLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_SlowSpinLeft_VarRefs.mm"

	return
	(
#		include "State_SlowSpinLeft_Transition_0.expr"
	);
}
