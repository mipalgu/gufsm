//
// State_Long_Left.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Long_Left.h"

#include "State_Long_Left_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Long_Left::Long_Left(const char *name): CLState(name, *new Long_Left::OnEntry, *new Long_Left::OnExit, *new Long_Left::Internal)
{
	_transitions[0] = new Transition_0();
}

Long_Left::~Long_Left()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Long_Left::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Left_VarRefs.mm"
#	include "State_Long_Left_OnEntry.mm"
}

void Long_Left::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Left_VarRefs.mm"
#	include "State_Long_Left_OnExit.mm"
}

void Long_Left::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Left_VarRefs.mm"
#	include "State_Long_Left_Internal.mm"
}

bool Long_Left::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Long_Left_VarRefs.mm"

	return
	(
#		include "State_Long_Left_Transition_0.expr"
	);
}
