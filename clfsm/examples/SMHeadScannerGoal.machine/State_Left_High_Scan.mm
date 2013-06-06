//
// State_Left_High_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"
#include "State_Left_High_Scan.h"

#include "State_Left_High_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScannerGoal;
using namespace State;

Left_High_Scan::Left_High_Scan(const char *name): CLState(name, *new Left_High_Scan::OnEntry, *new Left_High_Scan::OnExit, *new Left_High_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Left_High_Scan::~Left_High_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Left_High_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_High_Scan_VarRefs.mm"
#	include "State_Left_High_Scan_OnEntry.mm"
}

void Left_High_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_High_Scan_VarRefs.mm"
#	include "State_Left_High_Scan_OnExit.mm"
}

void Left_High_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_High_Scan_VarRefs.mm"
#	include "State_Left_High_Scan_Internal.mm"
}

bool Left_High_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_High_Scan_VarRefs.mm"

	return
	(
#		include "State_Left_High_Scan_Transition_0.expr"
	);
}
