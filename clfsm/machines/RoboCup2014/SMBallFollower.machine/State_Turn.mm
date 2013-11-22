//
// State_Turn.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Turn.h"

#include "State_Turn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Turn::Turn(const char *name): CLState(name, *new Turn::OnEntry, *new Turn::OnExit, *new Turn::Internal)
{
	_transitions[0] = new Transition_0();
}

Turn::~Turn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Turn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Turn_VarRefs.mm"
#	include "State_Turn_OnEntry.mm"
}

void Turn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Turn_VarRefs.mm"
#	include "State_Turn_OnExit.mm"
}

void Turn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Turn_VarRefs.mm"
#	include "State_Turn_Internal.mm"
}

bool Turn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Turn_VarRefs.mm"

	return
	(
#		include "State_Turn_Transition_0.expr"
	);
}
