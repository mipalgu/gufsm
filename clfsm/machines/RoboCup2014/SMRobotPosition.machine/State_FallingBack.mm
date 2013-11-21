//
// State_FallingBack.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMRobotPosition_Includes.h"
#include "SMRobotPosition.h"
#include "State_FallingBack.h"

#include "State_FallingBack_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMRobotPosition;
using namespace State;

FallingBack::FallingBack(const char *name): CLState(name, *new FallingBack::OnEntry, *new FallingBack::OnExit, *new FallingBack::Internal)
{
	_transitions[0] = new Transition_0();
}

FallingBack::~FallingBack()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FallingBack::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingBack_VarRefs.mm"
#	include "State_FallingBack_OnEntry.mm"
}

void FallingBack::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingBack_VarRefs.mm"
#	include "State_FallingBack_OnExit.mm"
}

void FallingBack::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingBack_VarRefs.mm"
#	include "State_FallingBack_Internal.mm"
}

bool FallingBack::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMRobotPosition_VarRefs.mm"
#	include "State_FallingBack_VarRefs.mm"

	return
	(
#		include "State_FallingBack_Transition_0.expr"
	);
}
