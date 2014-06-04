//
// State_FallingLeft.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "RobotPosition_Includes.h"
#include "RobotPosition.h"
#include "State_FallingLeft.h"

#include "State_FallingLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMRobotPosition;
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
#	include "RobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_OnEntry.mm"
}

void FallingLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_OnExit.mm"
}

void FallingLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"
#	include "State_FallingLeft_Internal.mm"
}

bool FallingLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_FallingLeft_VarRefs.mm"

	return
	(
#		include "State_FallingLeft_Transition_0.expr"
	);
}
