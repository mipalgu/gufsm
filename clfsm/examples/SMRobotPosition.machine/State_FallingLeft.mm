//
// State_FallingLeft.mm -- 2013-04-15 04:09:28 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_FallingLeft.h"

#include "State_FallingLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

FallingLeft::FallingLeft(const char *name): CLState(name, *new FallingLeft::OnEntry, *new FallingLeft::OnExit, *new FallingLeft::Internal)
{
	_transitions[0] = new Transition_0();
}

FallingLeft::~FallingLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FallingLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_OnEntry.mm"
}

void FallingLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_OnExit.mm"
}

void FallingLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_Internal.mm"
}

bool FallingLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"

	return
	(
#		include "State_FallingLeft_Transition_0.expr"
	);
}
