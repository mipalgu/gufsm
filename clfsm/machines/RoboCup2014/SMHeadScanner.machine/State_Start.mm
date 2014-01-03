//
// State_Start.mm
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

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
	_transitions[0] = new Transition_0();
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Start_VarRefs.mm"

	return
	(
#		include "State_Start_Transition_0.expr"
	);
}
