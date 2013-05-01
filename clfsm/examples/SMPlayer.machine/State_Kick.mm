//
// State_Kick.mm -- 2013-05-01 05:11:18 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_Kick.h"

#include "State_Kick_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

Kick::Kick(const char *name): CLState(name, *new Kick::OnEntry, *new Kick::OnExit, *new Kick::Internal)
{
	_transitions[0] = new Transition_0();
}

Kick::~Kick()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Kick::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_OnEntry.mm"
}

void Kick::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_OnExit.mm"
}

void Kick::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_Internal.mm"
}

bool Kick::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"

	return
	(
#		include "State_Kick_Transition_0.expr"
	);
}
