//
// State_FallingRight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_FallingRight.h"

#include "State_FallingRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

FallingRight::FallingRight(const char *name): CLState(name, *new FallingRight::OnEntry, *new FallingRight::OnExit, *new FallingRight::Internal)
{
	_transitions[0] = new Transition_0();
}

FallingRight::~FallingRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FallingRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingRight_VarRefs.mm"
#	include "State_FallingRight_OnEntry.mm"
}

void FallingRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingRight_VarRefs.mm"
#	include "State_FallingRight_OnExit.mm"
}

void FallingRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingRight_VarRefs.mm"
#	include "State_FallingRight_Internal.mm"
}

bool FallingRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingRight_VarRefs.mm"

	return
	(
#		include "State_FallingRight_Transition_0.expr"
	);
}
