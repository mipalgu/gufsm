//
// State_LeftWalk1.mm -- 2013-05-02 08:47:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_LeftWalk1.h"

#include "State_LeftWalk1_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

LeftWalk1::LeftWalk1(const char *name): CLState(name, *new LeftWalk1::OnEntry, *new LeftWalk1::OnExit, *new LeftWalk1::Internal)
{
	_transitions[0] = new Transition_0();
}

LeftWalk1::~LeftWalk1()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LeftWalk1::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk1_VarRefs.mm"
#	include "State_LeftWalk1_OnEntry.mm"
}

void LeftWalk1::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk1_VarRefs.mm"
#	include "State_LeftWalk1_OnExit.mm"
}

void LeftWalk1::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk1_VarRefs.mm"
#	include "State_LeftWalk1_Internal.mm"
}

bool LeftWalk1::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_LeftWalk1_VarRefs.mm"

	return
	(
#		include "State_LeftWalk1_Transition_0.expr"
	);
}
