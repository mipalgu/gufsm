//
// State_FindBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalie_Includes.h"
#include "SMGoalie.h"
#include "State_FindBall.h"

#include "State_FindBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalie;
using namespace State;

FindBall::FindBall(const char *name): CLState(name, *new FindBall::OnEntry, *new FindBall::OnExit, *new FindBall::Internal)
{
	_transitions[0] = new Transition_0();
}

FindBall::~FindBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FindBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FindBall_VarRefs.mm"
#	include "State_FindBall_OnEntry.mm"
}

void FindBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FindBall_VarRefs.mm"
#	include "State_FindBall_OnExit.mm"
}

void FindBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FindBall_VarRefs.mm"
#	include "State_FindBall_Internal.mm"
}

bool FindBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_FindBall_VarRefs.mm"

	return
	(
#		include "State_FindBall_Transition_0.expr"
	);
}
