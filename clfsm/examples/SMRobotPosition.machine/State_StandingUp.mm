//
// State_StandingUp.mm -- 2013-04-15 04:09:28 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_StandingUp.h"

#include "State_StandingUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

StandingUp::StandingUp(const char *name): CLState(name, *new StandingUp::OnEntry, *new StandingUp::OnExit, *new StandingUp::Internal)
{
	_transitions[0] = new Transition_0();
}

StandingUp::~StandingUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StandingUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_StandingUp_VarRefs.mm"
#	include "State_StandingUp_OnEntry.mm"
}

void StandingUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_StandingUp_VarRefs.mm"
#	include "State_StandingUp_OnExit.mm"
}

void StandingUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_StandingUp_VarRefs.mm"
#	include "State_StandingUp_Internal.mm"
}

bool StandingUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_StandingUp_VarRefs.mm"

	return
	(
#		include "State_StandingUp_Transition_0.expr"
	);
}
