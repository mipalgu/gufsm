//
//State_GET_MAX_SPEED_AND_CAMERA_WIDTH.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH.h"
#include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEpuckFollowsLine;
using namespace State;

GET_MAX_SPEED_AND_CAMERA_WIDTH::GET_MAX_SPEED_AND_CAMERA_WIDTH(const char *name):CLState(name, *new GET_MAX_SPEED_AND_CAMERA_WIDTH::OnEntry,*new GET_MAX_SPEED_AND_CAMERA_WIDTH::OnExit, *new GET_MAX_SPEED_AND_CAMERA_WIDTH::Internal)
{
	_transitions[0] = new Transition_0();
}

GET_MAX_SPEED_AND_CAMERA_WIDTH::~GET_MAX_SPEED_AND_CAMERA_WIDTH()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void GET_MAX_SPEED_AND_CAMERA_WIDTH::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_OnEntry.mm"
}

void GET_MAX_SPEED_AND_CAMERA_WIDTH::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_OnExit.mm"
}

void GET_MAX_SPEED_AND_CAMERA_WIDTH::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_Internal.mm"
}

bool GET_MAX_SPEED_AND_CAMERA_WIDTH::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_VarRefs.mm"

	return
	(
#			include "State_GET_MAX_SPEED_AND_CAMERA_WIDTH_Transition_0.expr"
	);
}


