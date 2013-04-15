//
// State_Wait_Release.mm -- 2013-04-15 05:40:11 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonChest_Includes.h"
#include "SMButtonChest.h"
#include "State_Wait_Release.h"

#include "State_Wait_Release_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMButtonChest;
using namespace State;

Wait_Release::Wait_Release(const char *name): CLState(name, *new Wait_Release::OnEntry, *new Wait_Release::OnExit, *new Wait_Release::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait_Release::~Wait_Release()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait_Release::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Wait_Release_VarRefs.mm"
#	include "State_Wait_Release_OnEntry.mm"
}

void Wait_Release::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Wait_Release_VarRefs.mm"
#	include "State_Wait_Release_OnExit.mm"
}

void Wait_Release::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Wait_Release_VarRefs.mm"
#	include "State_Wait_Release_Internal.mm"
}

bool Wait_Release::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Wait_Release_VarRefs.mm"

	return
	(
#		include "State_Wait_Release_Transition_0.expr"
	);
}
