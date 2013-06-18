//
// State_High_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"
#include "State_High_Scan.h"

#include "State_High_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScannerGoal;
using namespace State;

High_Scan::High_Scan(const char *name): CLState(name, *new High_Scan::OnEntry, *new High_Scan::OnExit, *new High_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

High_Scan::~High_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void High_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_High_Scan_VarRefs.mm"
#	include "State_High_Scan_OnEntry.mm"
}

void High_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_High_Scan_VarRefs.mm"
#	include "State_High_Scan_OnExit.mm"
}

void High_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_High_Scan_VarRefs.mm"
#	include "State_High_Scan_Internal.mm"
}

bool High_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_High_Scan_VarRefs.mm"

	return
	(
#		include "State_High_Scan_Transition_0.expr"
	);
}
