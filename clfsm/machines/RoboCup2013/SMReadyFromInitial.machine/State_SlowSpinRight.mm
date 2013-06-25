//
// State_SlowSpinRight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_SlowSpinRight.h"

#include "State_SlowSpinRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

SlowSpinRight::SlowSpinRight(const char *name): CLState(name, *new SlowSpinRight::OnEntry, *new SlowSpinRight::OnExit, *new SlowSpinRight::Internal)
{
	_transitions[0] = new Transition_0();
}

SlowSpinRight::~SlowSpinRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SlowSpinRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SlowSpinRight_VarRefs.mm"
#	include "State_SlowSpinRight_OnEntry.mm"
}

void SlowSpinRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SlowSpinRight_VarRefs.mm"
#	include "State_SlowSpinRight_OnExit.mm"
}

void SlowSpinRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SlowSpinRight_VarRefs.mm"
#	include "State_SlowSpinRight_Internal.mm"
}

bool SlowSpinRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SlowSpinRight_VarRefs.mm"

	return
	(
#		include "State_SlowSpinRight_Transition_0.expr"
	);
}
