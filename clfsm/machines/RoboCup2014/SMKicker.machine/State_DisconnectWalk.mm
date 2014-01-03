//
// State_DisconnectWalk.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_DisconnectWalk.h"

#include "State_DisconnectWalk_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

DisconnectWalk::DisconnectWalk(const char *name): CLState(name, *new DisconnectWalk::OnEntry, *new DisconnectWalk::OnExit, *new DisconnectWalk::Internal)
{
	_transitions[0] = new Transition_0();
}

DisconnectWalk::~DisconnectWalk()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DisconnectWalk::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DisconnectWalk_VarRefs.mm"
#	include "State_DisconnectWalk_OnEntry.mm"
}

void DisconnectWalk::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DisconnectWalk_VarRefs.mm"
#	include "State_DisconnectWalk_OnExit.mm"
}

void DisconnectWalk::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DisconnectWalk_VarRefs.mm"
#	include "State_DisconnectWalk_Internal.mm"
}

bool DisconnectWalk::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_DisconnectWalk_VarRefs.mm"

	return
	(
#		include "State_DisconnectWalk_Transition_0.expr"
	);
}
