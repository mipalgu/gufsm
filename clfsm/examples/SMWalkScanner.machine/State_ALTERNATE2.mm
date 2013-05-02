//
// State_ALTERNATE2.mm -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_ALTERNATE2.h"

#include "State_ALTERNATE2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

ALTERNATE2::ALTERNATE2(const char *name): CLState(name, *new ALTERNATE2::OnEntry, *new ALTERNATE2::OnExit, *new ALTERNATE2::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ALTERNATE2::~ALTERNATE2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ALTERNATE2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE2_VarRefs.mm"
#	include "State_ALTERNATE2_OnEntry.mm"
}

void ALTERNATE2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE2_VarRefs.mm"
#	include "State_ALTERNATE2_OnExit.mm"
}

void ALTERNATE2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE2_VarRefs.mm"
#	include "State_ALTERNATE2_Internal.mm"
}

bool ALTERNATE2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE2_VarRefs.mm"

	return
	(
#		include "State_ALTERNATE2_Transition_0.expr"
	);
}

bool ALTERNATE2::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_ALTERNATE2_VarRefs.mm"

	return
	(
#		include "State_ALTERNATE2_Transition_1.expr"
	);
}
