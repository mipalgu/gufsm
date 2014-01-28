//
//State_SET_MOTOR_SPEED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_SET_MOTOR_SPEED.h"
#include "State_SET_MOTOR_SPEED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLineFollower;
using namespace State;

SET_MOTOR_SPEED::SET_MOTOR_SPEED(const char *name):CLState(name, *new SET_MOTOR_SPEED::OnEntry,*new SET_MOTOR_SPEED::OnExit, *new SET_MOTOR_SPEED::Internal)
{
	_transitions[0] = new Transition_0();
}

SET_MOTOR_SPEED::~SET_MOTOR_SPEED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SET_MOTOR_SPEED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_OnEntry.mm"
}

void SET_MOTOR_SPEED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_OnExit.mm"
}

void SET_MOTOR_SPEED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_Internal.mm"
}

bool SET_MOTOR_SPEED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_SET_MOTOR_SPEED_VarRefs.mm"

	return
	(
#			include "State_SET_MOTOR_SPEED_Transition_0.expr"
	);
}


