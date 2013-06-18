//
// State_Head_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalApproach_Includes.h"
#include "SMGoalApproach.h"
#include "State_Head_Scan.h"

#include "State_Head_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalApproach;
using namespace State;

Head_Scan::Head_Scan(const char *name): CLState(name, *new Head_Scan::OnEntry, *new Head_Scan::OnExit, *new Head_Scan::Internal)
{
}

Head_Scan::~Head_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Head_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Head_Scan_VarRefs.mm"
#	include "State_Head_Scan_OnEntry.mm"
}

void Head_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Head_Scan_VarRefs.mm"
#	include "State_Head_Scan_OnExit.mm"
}

void Head_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalApproach_VarRefs.mm"
#	include "State_Head_Scan_VarRefs.mm"
#	include "State_Head_Scan_Internal.mm"
}
