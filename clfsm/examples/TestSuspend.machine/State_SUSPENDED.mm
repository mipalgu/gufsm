//
//State_SUSPENDED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "TestSuspend_Includes.h"
#include "TestSuspend.h"

#include "State_SUSPENDED.h"
#include "State_SUSPENDED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTestSuspend;
using namespace State;

SUSPENDED::SUSPENDED(const char *name):CLState(name, *new SUSPENDED::OnEntry,*new SUSPENDED::OnExit, *new SUSPENDED::Internal)
{
	_transitions[0] = new Transition_0();
}

SUSPENDED::~SUSPENDED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SUSPENDED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnEntry.mm"
}

void SUSPENDED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnExit.mm"
}

void SUSPENDED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_Internal.mm"
}

bool SUSPENDED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"

	return
	(
#			include "State_SUSPENDED_Transition_0.expr"
	);
}


