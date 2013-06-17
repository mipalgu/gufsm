//
// State_WalkForward.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_WalkForward.h"

#include "State_WalkForward_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

WalkForward::WalkForward(const char *name): CLState(name, *new WalkForward::OnEntry, *new WalkForward::OnExit, *new WalkForward::Internal)
{
	_transitions[0] = new Transition_0();
}

WalkForward::~WalkForward()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WalkForward::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_WalkForward_VarRefs.mm"
#	include "State_WalkForward_OnEntry.mm"
}

void WalkForward::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_WalkForward_VarRefs.mm"
#	include "State_WalkForward_OnExit.mm"
}

void WalkForward::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_WalkForward_VarRefs.mm"
#	include "State_WalkForward_Internal.mm"
}

bool WalkForward::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_WalkForward_VarRefs.mm"

	return
	(
#		include "State_WalkForward_Transition_0.expr"
	);
}
