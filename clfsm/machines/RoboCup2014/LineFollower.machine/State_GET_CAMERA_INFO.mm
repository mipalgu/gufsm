//
//State_GET_CAMERA_INFO.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_GET_CAMERA_INFO.h"
#include "State_GET_CAMERA_INFO_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLineFollower;
using namespace State;

GET_CAMERA_INFO::GET_CAMERA_INFO(const char *name):CLState(name, *new GET_CAMERA_INFO::OnEntry,*new GET_CAMERA_INFO::OnExit, *new GET_CAMERA_INFO::Internal)
{
	_transitions[0] = new Transition_0();
}

GET_CAMERA_INFO::~GET_CAMERA_INFO()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void GET_CAMERA_INFO::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_OnEntry.mm"
}

void GET_CAMERA_INFO::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_OnExit.mm"
}

void GET_CAMERA_INFO::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_Internal.mm"
}

bool GET_CAMERA_INFO::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_CAMERA_INFO_VarRefs.mm"

	return
	(
#			include "State_GET_CAMERA_INFO_Transition_0.expr"
	);
}


