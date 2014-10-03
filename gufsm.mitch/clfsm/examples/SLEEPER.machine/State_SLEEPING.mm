//
//State_SLEEPING.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "SLEEPER_Includes.h"
#include "SLEEPER.h"

#include "State_SLEEPING.h"
#include "State_SLEEPING_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLEEPER;
using namespace State;

SLEEPING::SLEEPING(const char *name):CLState(name, *new SLEEPING::OnEntry,*new SLEEPING::OnExit, *new SLEEPING::Internal)
{
	_transitions[0] = new Transition_0();
}

SLEEPING::~SLEEPING()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SLEEPING::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLEEPER_VarRefs.mm"
#	include "State_SLEEPING_VarRefs.mm"
#	include "State_SLEEPING_OnEntry.mm"
}

void SLEEPING::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLEEPER_VarRefs.mm"
#	include "State_SLEEPING_VarRefs.mm"
#	include "State_SLEEPING_OnExit.mm"
}

void SLEEPING::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLEEPER_VarRefs.mm"
#	include "State_SLEEPING_VarRefs.mm"
#	include "State_SLEEPING_Internal.mm"
}

bool SLEEPING::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLEEPER_VarRefs.mm"
#	include "State_SLEEPING_VarRefs.mm"

	return
	(
#			include "State_SLEEPING_Transition_0.expr"
	);
}


