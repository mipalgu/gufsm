//
// State_Start.mm -- 2013-04-26 03:55:22 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_Start.h"

#include "State_Start_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScanner;
using namespace State;

Start::Start(const char *name): CLState(name, *new Start::OnEntry, *new Start::OnExit, *new Start::Internal)
{
	_transitions[0] = new Transition_0();
}

Start::~Start()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Start::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnEntry.mm"
}

void Start::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnExit.mm"
}

void Start::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_Internal.mm"
}

bool Start::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"

	return
	(
#		include "State_Start_Transition_0.expr"
	);
}
