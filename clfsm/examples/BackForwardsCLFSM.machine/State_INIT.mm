//
// State_INIT.mm -- 2013-01-23 06:27:02 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BackForwardsCLFSM_Includes.h"
#include "BackForwardsCLFSM.h"
#include "State_INIT.h"

#include "State_INIT_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

INIT::INIT(const char *name): CLState(name, *new INIT::OnEntry, *new INIT::OnExit, *new INIT::Internal)
{
	_transitions[0] = new Transition_0();
}

INIT::~INIT()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void INIT::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BackForwardsCLFSM_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_OnEntry.mm"
}

void INIT::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BackForwardsCLFSM_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_OnExit.mm"
}

void INIT::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BackForwardsCLFSM_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_Internal.mm"
}

bool INIT::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BackForwardsCLFSM_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"

	return
	(
#		include "State_INIT_Transition_0.expr"
	);
}
