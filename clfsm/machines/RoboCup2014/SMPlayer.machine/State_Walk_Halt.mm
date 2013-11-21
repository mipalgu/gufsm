//
// State_Walk_Halt.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_Walk_Halt.h"

#include "State_Walk_Halt_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

Walk_Halt::Walk_Halt(const char *name): CLState(name, *new Walk_Halt::OnEntry, *new Walk_Halt::OnExit, *new Walk_Halt::Internal)
{
	_transitions[0] = new Transition_0();
}

Walk_Halt::~Walk_Halt()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Walk_Halt::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_OnEntry.mm"
}

void Walk_Halt::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_OnExit.mm"
}

void Walk_Halt::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_Internal.mm"
}

bool Walk_Halt::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"

	return
	(
#		include "State_Walk_Halt_Transition_0.expr"
	);
}
