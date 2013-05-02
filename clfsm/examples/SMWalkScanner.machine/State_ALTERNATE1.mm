//
// State_ALTERNATE1.mm -- 2013-05-02 08:47:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_ALTERNATE1.h"

#include "State_ALTERNATE1_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

ALTERNATE1::ALTERNATE1(const char *name): CLState(name, *new ALTERNATE1::OnEntry, *new ALTERNATE1::OnExit, *new ALTERNATE1::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ALTERNATE1::~ALTERNATE1()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ALTERNATE1::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE1_VarRefs.mm"
#	include "State_ALTERNATE1_OnEntry.mm"
}

void ALTERNATE1::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE1_VarRefs.mm"
#	include "State_ALTERNATE1_OnExit.mm"
}

void ALTERNATE1::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE1_VarRefs.mm"
#	include "State_ALTERNATE1_Internal.mm"
}

bool ALTERNATE1::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE1_VarRefs.mm"

	return
	(
#		include "State_ALTERNATE1_Transition_0.expr"
	);
}

bool ALTERNATE1::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE1_VarRefs.mm"

	return
	(
#		include "State_ALTERNATE1_Transition_1.expr"
	);
}
