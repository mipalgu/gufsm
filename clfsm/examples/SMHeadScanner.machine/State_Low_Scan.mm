//
// State_Low_Scan.mm -- 2013-04-26 03:55:22 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_Low_Scan.h"

#include "State_Low_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScanner;
using namespace State;

Low_Scan::Low_Scan(const char *name): CLState(name, *new Low_Scan::OnEntry, *new Low_Scan::OnExit, *new Low_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Low_Scan::~Low_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Low_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Low_Scan_VarRefs.mm"
#	include "State_Low_Scan_OnEntry.mm"
}

void Low_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Low_Scan_VarRefs.mm"
#	include "State_Low_Scan_OnExit.mm"
}

void Low_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Low_Scan_VarRefs.mm"
#	include "State_Low_Scan_Internal.mm"
}

bool Low_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Low_Scan_VarRefs.mm"

	return
	(
#		include "State_Low_Scan_Transition_0.expr"
	);
}
