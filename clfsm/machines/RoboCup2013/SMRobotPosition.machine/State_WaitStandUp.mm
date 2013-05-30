//
// State_WaitStandUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_WaitStandUp.h"

#include "State_WaitStandUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

WaitStandUp::WaitStandUp(const char *name): CLState(name, *new WaitStandUp::OnEntry, *new WaitStandUp::OnExit, *new WaitStandUp::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

WaitStandUp::~WaitStandUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void WaitStandUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_WaitStandUp_VarRefs.mm"
#	include "State_WaitStandUp_OnEntry.mm"
}

void WaitStandUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_WaitStandUp_VarRefs.mm"
#	include "State_WaitStandUp_OnExit.mm"
}

void WaitStandUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_WaitStandUp_VarRefs.mm"
#	include "State_WaitStandUp_Internal.mm"
}

bool WaitStandUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_WaitStandUp_VarRefs.mm"

	return
	(
#		include "State_WaitStandUp_Transition_0.expr"
	);
}

bool WaitStandUp::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_WaitStandUp_VarRefs.mm"

	return
	(
#		include "State_WaitStandUp_Transition_1.expr"
	);
}
