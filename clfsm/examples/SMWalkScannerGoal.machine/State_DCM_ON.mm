//
// State_DCM_ON.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScannerGoal_Includes.h"
#include "SMWalkScannerGoal.h"
#include "State_DCM_ON.h"

#include "State_DCM_ON_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScannerGoal;
using namespace State;

DCM_ON::DCM_ON(const char *name): CLState(name, *new DCM_ON::OnEntry, *new DCM_ON::OnExit, *new DCM_ON::Internal)
{
}

DCM_ON::~DCM_ON()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void DCM_ON::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_OnEntry.mm"
}

void DCM_ON::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_OnExit.mm"
}

void DCM_ON::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_Internal.mm"
}
