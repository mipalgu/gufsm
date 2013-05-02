//
// State_RightWalk2.mm -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_RightWalk2.h"

#include "State_RightWalk2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

RightWalk2::RightWalk2(const char *name): CLState(name, *new RightWalk2::OnEntry, *new RightWalk2::OnExit, *new RightWalk2::Internal)
{
	_transitions[0] = new Transition_0();
}

RightWalk2::~RightWalk2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RightWalk2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk2_VarRefs.mm"
#	include "State_RightWalk2_OnEntry.mm"
}

void RightWalk2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk2_VarRefs.mm"
#	include "State_RightWalk2_OnExit.mm"
}

void RightWalk2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk2_VarRefs.mm"
#	include "State_RightWalk2_Internal.mm"
}

bool RightWalk2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk2_VarRefs.mm"

	return
	(
#		include "State_RightWalk2_Transition_0.expr"
	);
}
