//
//State_SET_MOTORS_SPEED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_SET_MOTORS_SPEED.h"
#include "State_SET_MOTORS_SPEED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEpuckFollowsLine;
using namespace State;

SET_MOTORS_SPEED::SET_MOTORS_SPEED(const char *name):CLState(name, *new SET_MOTORS_SPEED::OnEntry,*new SET_MOTORS_SPEED::OnExit, *new SET_MOTORS_SPEED::Internal)
{
	_transitions[0] = new Transition_0();
}

SET_MOTORS_SPEED::~SET_MOTORS_SPEED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SET_MOTORS_SPEED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_OnEntry.mm"
}

void SET_MOTORS_SPEED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_OnExit.mm"
}

void SET_MOTORS_SPEED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_Internal.mm"
}

bool SET_MOTORS_SPEED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_SET_MOTORS_SPEED_VarRefs.mm"

	return
	(
#			include "State_SET_MOTORS_SPEED_Transition_0.expr"
	);
}


