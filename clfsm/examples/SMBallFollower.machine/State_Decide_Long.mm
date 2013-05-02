//
// State_Decide_Long.mm -- 2013-05-02 08:33:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Decide_Long.h"

#include "State_Decide_Long_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Decide_Long::Decide_Long(const char *name): CLState(name, *new Decide_Long::OnEntry, *new Decide_Long::OnExit, *new Decide_Long::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Decide_Long::~Decide_Long()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Decide_Long::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_OnEntry.mm"
}

void Decide_Long::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_OnExit.mm"
}

void Decide_Long::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"
#	include "State_Decide_Long_Internal.mm"
}

bool Decide_Long::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"

	return
	(
#		include "State_Decide_Long_Transition_0.expr"
	);
}

bool Decide_Long::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"

	return
	(
#		include "State_Decide_Long_Transition_1.expr"
	);
}

bool Decide_Long::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Long_VarRefs.mm"

	return
	(
#		include "State_Decide_Long_Transition_2.expr"
	);
}
