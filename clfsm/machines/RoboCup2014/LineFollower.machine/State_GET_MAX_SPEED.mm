//
//State_GET_MAX_SPEED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "LineFollower_Includes.h"
#include "LineFollower.h"

#include "State_GET_MAX_SPEED.h"
#include "State_GET_MAX_SPEED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLineFollower;
using namespace State;

GET_MAX_SPEED::GET_MAX_SPEED(const char *name):CLState(name, *new GET_MAX_SPEED::OnEntry,*new GET_MAX_SPEED::OnExit, *new GET_MAX_SPEED::Internal)
{
	_transitions[0] = new Transition_0();
}

GET_MAX_SPEED::~GET_MAX_SPEED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void GET_MAX_SPEED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_MAX_SPEED_VarRefs.mm"
#	include "State_GET_MAX_SPEED_OnEntry.mm"
}

void GET_MAX_SPEED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_MAX_SPEED_VarRefs.mm"
#	include "State_GET_MAX_SPEED_OnExit.mm"
}

void GET_MAX_SPEED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_MAX_SPEED_VarRefs.mm"
#	include "State_GET_MAX_SPEED_Internal.mm"
}

bool GET_MAX_SPEED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LineFollower_VarRefs.mm"
#	include "State_GET_MAX_SPEED_VarRefs.mm"

	return
	(
#			include "State_GET_MAX_SPEED_Transition_0.expr"
	);
}


