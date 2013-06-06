//
// State_Init.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScannerGoal_Includes.h"
#include "SMWalkScannerGoal.h"
#include "State_Init.h"

#include "State_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScannerGoal;
using namespace State;

Init::Init(const char *name): CLState(name, *new Init::OnEntry, *new Init::OnExit, *new Init::Internal)
{
}

Init::~Init()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnEntry.mm"
}

void Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnExit.mm"
}

void Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_Internal.mm"
}
