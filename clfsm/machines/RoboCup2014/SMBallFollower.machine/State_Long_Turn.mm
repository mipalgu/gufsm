//
// State_Long_Turn.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Long_Turn.h"

#include "State_Long_Turn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Long_Turn::Long_Turn(const char *name): CLState(name, *new Long_Turn::OnEntry, *new Long_Turn::OnExit, *new Long_Turn::Internal)
{
	_transitions[0] = new Transition_0();
}

Long_Turn::~Long_Turn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Long_Turn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Turn_VarRefs.mm"
#	include "State_Long_Turn_OnEntry.mm"
}

void Long_Turn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Turn_VarRefs.mm"
#	include "State_Long_Turn_OnExit.mm"
}

void Long_Turn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Turn_VarRefs.mm"
#	include "State_Long_Turn_Internal.mm"
}

bool Long_Turn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Turn_VarRefs.mm"

	return
	(
#		include "State_Long_Turn_Transition_0.expr"
	);
}
