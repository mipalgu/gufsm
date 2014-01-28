//
//State_TURN_ON_CAMERA.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_TURN_ON_CAMERA.h"
#include "State_TURN_ON_CAMERA_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLineFollower;
using namespace State;

TURN_ON_CAMERA::TURN_ON_CAMERA(const char *name):CLState(name, *new TURN_ON_CAMERA::OnEntry,*new TURN_ON_CAMERA::OnExit, *new TURN_ON_CAMERA::Internal)
{
	_transitions[0] = new Transition_0();
}

TURN_ON_CAMERA::~TURN_ON_CAMERA()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void TURN_ON_CAMERA::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_OnEntry.mm"
}

void TURN_ON_CAMERA::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_OnExit.mm"
}

void TURN_ON_CAMERA::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_Internal.mm"
}

bool TURN_ON_CAMERA::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_TURN_ON_CAMERA_VarRefs.mm"

	return
	(
#			include "State_TURN_ON_CAMERA_Transition_0.expr"
	);
}


