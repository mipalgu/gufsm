//
// State_LostBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_LostBall.h"

#include "State_LostBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

LostBall::LostBall(const char *name): CLState(name, *new LostBall::OnEntry, *new LostBall::OnExit, *new LostBall::Internal)
{
	_transitions[0] = new Transition_0();
}

LostBall::~LostBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LostBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_LostBall_VarRefs.mm"
#	include "State_LostBall_OnEntry.mm"
}

void LostBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_LostBall_VarRefs.mm"
#	include "State_LostBall_OnExit.mm"
}

void LostBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_LostBall_VarRefs.mm"
#	include "State_LostBall_Internal.mm"
}

bool LostBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_LostBall_VarRefs.mm"

	return
	(
#		include "State_LostBall_Transition_0.expr"
	);
}
