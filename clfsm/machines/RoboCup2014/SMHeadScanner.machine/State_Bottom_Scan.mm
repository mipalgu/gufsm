//
// State_Bottom_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_Bottom_Scan.h"

#include "State_Bottom_Scan_Includes.h"

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
#	include "State_Bottom_Scan_VarRefs.mm"
#	include "State_Bottom_Scan_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Bottom_Scan_VarRefs.mm"
#	include "State_Bottom_Scan_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Bottom_Scan_VarRefs.mm"
#	include "State_Bottom_Scan_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Bottom_Scan_VarRefs.mm"

	return
	(
#		include "State_Bottom_Scan_Transition_0.expr"
	);
}
