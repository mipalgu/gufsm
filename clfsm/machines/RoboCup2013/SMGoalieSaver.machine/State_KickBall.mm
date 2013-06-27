//
// State_KickBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_KickBall.h"

#include "State_KickBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

KickBall::KickBall(const char *name): CLState(name, *new KickBall::OnEntry, *new KickBall::OnExit, *new KickBall::Internal)
{
	_transitions[0] = new Transition_0();
}

KickBall::~KickBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void KickBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_KickBall_VarRefs.mm"
#	include "State_KickBall_OnEntry.mm"
}

void KickBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_KickBall_VarRefs.mm"
#	include "State_KickBall_OnExit.mm"
}

void KickBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_KickBall_VarRefs.mm"
#	include "State_KickBall_Internal.mm"
}

bool KickBall::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_KickBall_VarRefs.mm"

	return
	(
#		include "State_KickBall_Transition_0.expr"
	);
}
