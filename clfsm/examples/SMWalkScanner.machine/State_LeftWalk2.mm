//
// State_LeftWalk2.mm -- 2013-05-02 08:47:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_LeftWalk2.h"

#include "State_LeftWalk2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

LeftWalk2::LeftWalk2(const char *name): CLState(name, *new LeftWalk2::OnEntry, *new LeftWalk2::OnExit, *new LeftWalk2::Internal)
{
	_transitions[0] = new Transition_0();
}

LeftWalk2::~LeftWalk2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LeftWalk2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk2_VarRefs.mm"
#	include "State_LeftWalk2_OnEntry.mm"
}

void LeftWalk2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk2_VarRefs.mm"
#	include "State_LeftWalk2_OnExit.mm"
}

void LeftWalk2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk2_VarRefs.mm"
#	include "State_LeftWalk2_Internal.mm"
}

bool LeftWalk2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk2_VarRefs.mm"

	return
	(
#		include "State_LeftWalk2_Transition_0.expr"
	);
}
