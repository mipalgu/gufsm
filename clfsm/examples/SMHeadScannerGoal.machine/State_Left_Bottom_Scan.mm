//
// State_Left_Bottom_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScannerGoal_Includes.h"
#include "SMHeadScannerGoal.h"
#include "State_Left_Bottom_Scan.h"

#include "State_Left_Bottom_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScannerGoal;
using namespace State;

Left_Bottom_Scan::Left_Bottom_Scan(const char *name): CLState(name, *new Left_Bottom_Scan::OnEntry, *new Left_Bottom_Scan::OnExit, *new Left_Bottom_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Left_Bottom_Scan::~Left_Bottom_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Left_Bottom_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_Bottom_Scan_VarRefs.mm"
#	include "State_Left_Bottom_Scan_OnEntry.mm"
}

void Left_Bottom_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_Bottom_Scan_VarRefs.mm"
#	include "State_Left_Bottom_Scan_OnExit.mm"
}

void Left_Bottom_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_Bottom_Scan_VarRefs.mm"
#	include "State_Left_Bottom_Scan_Internal.mm"
}

bool Left_Bottom_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScannerGoal_VarRefs.mm"
#	include "State_Left_Bottom_Scan_VarRefs.mm"

	return
	(
#		include "State_Left_Bottom_Scan_Transition_0.expr"
	);
}
