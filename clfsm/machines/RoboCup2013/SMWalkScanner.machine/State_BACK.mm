//
// State_BACK.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_BACK.h"

#include "State_BACK_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

BACK::BACK(const char *name): CLState(name, *new BACK::OnEntry, *new BACK::OnExit, *new BACK::Internal)
{
	_transitions[0] = new Transition_0();
}

BACK::~BACK()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void BACK::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_BACK_VarRefs.mm"
#	include "State_BACK_OnEntry.mm"
}

void BACK::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_BACK_VarRefs.mm"
#	include "State_BACK_OnExit.mm"
}

void BACK::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_BACK_VarRefs.mm"
#	include "State_BACK_Internal.mm"
}

bool BACK::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_BACK_VarRefs.mm"

	return
	(
#		include "State_BACK_Transition_0.expr"
	);
}
