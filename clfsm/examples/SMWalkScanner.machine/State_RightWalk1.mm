//
// State_RightWalk1.mm -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_RightWalk1.h"

#include "State_RightWalk1_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

RightWalk1::RightWalk1(const char *name): CLState(name, *new RightWalk1::OnEntry, *new RightWalk1::OnExit, *new RightWalk1::Internal)
{
	_transitions[0] = new Transition_0();
}

RightWalk1::~RightWalk1()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RightWalk1::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk1_VarRefs.mm"
#	include "State_RightWalk1_OnEntry.mm"
}

void RightWalk1::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk1_VarRefs.mm"
#	include "State_RightWalk1_OnExit.mm"
}

void RightWalk1::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk1_VarRefs.mm"
#	include "State_RightWalk1_Internal.mm"
}

bool RightWalk1::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_RightWalk1_VarRefs.mm"

	return
	(
#		include "State_RightWalk1_Transition_0.expr"
	);
}
