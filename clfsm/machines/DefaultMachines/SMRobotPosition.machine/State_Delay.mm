//
// State_Delay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_Delay.h"

#include "State_Delay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

Delay::Delay(const char *name): CLState(name, *new Delay::OnEntry, *new Delay::OnExit, *new Delay::Internal)
{
	_transitions[0] = new Transition_0();
}

Delay::~Delay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Delay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_Delay_VarRefs.mm"
#	include "State_Delay_OnEntry.mm"
}

void Delay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_Delay_VarRefs.mm"
#	include "State_Delay_OnExit.mm"
}

void Delay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_Delay_VarRefs.mm"
#	include "State_Delay_Internal.mm"
}

bool Delay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_Delay_VarRefs.mm"

	return
	(
#		include "State_Delay_Transition_0.expr"
	);
}
