//
// State_SeekBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Kick_Includes.h"
#include "Color_Learner_Kick.h"
#include "State_SeekBall.h"

#include "State_SeekBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner_Kick;
using namespace State;

SeekBall::SeekBall(const char *name): CLState(name, *new SeekBall::OnEntry, *new SeekBall::OnExit, *new SeekBall::Internal)
{
	_transitions[0] = new Transition_0();
}

SeekBall::~SeekBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SeekBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_OnEntry.mm"
}

void SeekBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_OnExit.mm"
}

void SeekBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_Internal.mm"
}

bool SeekBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"

	return
	(
#		include "State_SeekBall_Transition_0.expr"
	);
}
