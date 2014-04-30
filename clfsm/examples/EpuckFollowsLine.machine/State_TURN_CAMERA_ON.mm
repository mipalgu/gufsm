//
//State_TURN_CAMERA_ON.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_TURN_CAMERA_ON.h"
#include "State_TURN_CAMERA_ON_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEpuckFollowsLine;
using namespace State;

TURN_CAMERA_ON::TURN_CAMERA_ON(const char *name):CLState(name, *new TURN_CAMERA_ON::OnEntry,*new TURN_CAMERA_ON::OnExit, *new TURN_CAMERA_ON::Internal)
{
	_transitions[0] = new Transition_0();
}

TURN_CAMERA_ON::~TURN_CAMERA_ON()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void TURN_CAMERA_ON::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_OnEntry.mm"
}

void TURN_CAMERA_ON::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_OnExit.mm"
}

void TURN_CAMERA_ON::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_Internal.mm"
}

bool TURN_CAMERA_ON::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_CAMERA_ON_VarRefs.mm"

	return
	(
#			include "State_TURN_CAMERA_ON_Transition_0.expr"
	);
}


