//
// State_Right_Long_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"
#include "State_Right_Long_Scan.h"

#include "State_Right_Long_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScannerGoal;
using namespace State;

Right_Long_Scan::Right_Long_Scan(const char *name): CLState(name, *new Right_Long_Scan::OnEntry, *new Right_Long_Scan::OnExit, *new Right_Long_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Right_Long_Scan::~Right_Long_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Right_Long_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Right_Long_Scan_VarRefs.mm"
#	include "State_Right_Long_Scan_OnEntry.mm"
}

void Right_Long_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Right_Long_Scan_VarRefs.mm"
#	include "State_Right_Long_Scan_OnExit.mm"
}

void Right_Long_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Right_Long_Scan_VarRefs.mm"
#	include "State_Right_Long_Scan_Internal.mm"
}

bool Right_Long_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Right_Long_Scan_VarRefs.mm"

	return
	(
#		include "State_Right_Long_Scan_Transition_0.expr"
	);
}
