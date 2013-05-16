//
// State_Long_Right.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Long_Right.h"

#include "State_Long_Right_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Long_Right::Long_Right(const char *name): CLState(name, *new Long_Right::OnEntry, *new Long_Right::OnExit, *new Long_Right::Internal)
{
	_transitions[0] = new Transition_0();
}

Long_Right::~Long_Right()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Long_Right::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Right_VarRefs.mm"
#	include "State_Long_Right_OnEntry.mm"
}

void Long_Right::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Right_VarRefs.mm"
#	include "State_Long_Right_OnExit.mm"
}

void Long_Right::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Right_VarRefs.mm"
#	include "State_Long_Right_Internal.mm"
}

bool Long_Right::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Right_VarRefs.mm"

	return
	(
#		include "State_Long_Right_Transition_0.expr"
	);
}
