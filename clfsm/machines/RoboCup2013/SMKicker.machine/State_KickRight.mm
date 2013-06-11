//
// State_KickRight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker3_Includes.h"
#include "SMKicker3.h"
#include "State_KickRight.h"

#include "State_KickRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker3;
using namespace State;

KickRight::KickRight(const char *name): CLState(name, *new KickRight::OnEntry, *new KickRight::OnExit, *new KickRight::Internal)
{
	_transitions[0] = new Transition_0();
}

KickRight::~KickRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void KickRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickRight_VarRefs.mm"
#	include "State_KickRight_OnEntry.mm"
}

void KickRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickRight_VarRefs.mm"
#	include "State_KickRight_OnExit.mm"
}

void KickRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickRight_VarRefs.mm"
#	include "State_KickRight_Internal.mm"
}

bool KickRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickRight_VarRefs.mm"

	return
	(
#		include "State_KickRight_Transition_0.expr"
	);
}
