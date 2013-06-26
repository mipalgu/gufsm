//
// State_Continue.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_Continue.h"

#include "State_Continue_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

Continue::Continue(const char *name): CLState(name, *new Continue::OnEntry, *new Continue::OnExit, *new Continue::Internal)
{
	_transitions[0] = new Transition_0();
}

Continue::~Continue()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Continue::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Continue_VarRefs.mm"
#	include "State_Continue_OnEntry.mm"
}

void Continue::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Continue_VarRefs.mm"
#	include "State_Continue_OnExit.mm"
}

void Continue::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Continue_VarRefs.mm"
#	include "State_Continue_Internal.mm"
}

bool Continue::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Continue_VarRefs.mm"

	return
	(
#		include "State_Continue_Transition_0.expr"
	);
}
