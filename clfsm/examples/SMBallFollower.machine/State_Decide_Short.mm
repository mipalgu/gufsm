//
// State_Decide_Short.mm -- 2013-05-14 05:36:09 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMBallFollower_Includes.h"
#include "SMBallFollower.h"
#include "State_Decide_Short.h"

#include "State_Decide_Short_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMBallFollower;
using namespace State;

Decide_Short::Decide_Short(const char *name): CLState(name, *new Decide_Short::OnEntry, *new Decide_Short::OnExit, *new Decide_Short::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
}

Decide_Short::~Decide_Short()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
}

void Decide_Short::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"
#	include "State_Decide_Short_OnEntry.mm"
}

void Decide_Short::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"
#	include "State_Decide_Short_OnExit.mm"
}

void Decide_Short::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"
#	include "State_Decide_Short_Internal.mm"
}

bool Decide_Short::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"

	return
	(
#		include "State_Decide_Short_Transition_0.expr"
	);
}

bool Decide_Short::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"

	return
	(
#		include "State_Decide_Short_Transition_1.expr"
	);
}

bool Decide_Short::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"

	return
	(
#		include "State_Decide_Short_Transition_2.expr"
	);
}

bool Decide_Short::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMBallFollower_VarRefs.mm"
#	include "State_Decide_Short_VarRefs.mm"

	return
	(
#		include "State_Decide_Short_Transition_3.expr"
	);
}
