//
// State_KickLeft.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker3_Includes.h"
#include "SMKicker3.h"
#include "State_KickLeft.h"

#include "State_KickLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker3;
using namespace State;

KickLeft::KickLeft(const char *name): CLState(name, *new KickLeft::OnEntry, *new KickLeft::OnExit, *new KickLeft::Internal)
{
	_transitions[0] = new Transition_0();
}

KickLeft::~KickLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void KickLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickLeft_VarRefs.mm"
#	include "State_KickLeft_OnEntry.mm"
}

void KickLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickLeft_VarRefs.mm"
#	include "State_KickLeft_OnExit.mm"
}

void KickLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickLeft_VarRefs.mm"
#	include "State_KickLeft_Internal.mm"
}

bool KickLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_KickLeft_VarRefs.mm"

	return
	(
#		include "State_KickLeft_Transition_0.expr"
	);
}
