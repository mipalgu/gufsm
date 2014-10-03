//
// State_Main.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScannerGoal_Includes.h"
#include "SMWalkScannerGoal.h"
#include "State_Main.h"

#include "State_Main_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScannerGoal;
using namespace State;

Main::Main(const char *name): CLState(name, *new Main::OnEntry, *new Main::OnExit, *new Main::Internal)
{
}

Main::~Main()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Main::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_OnEntry.mm"
}

void Main::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_OnExit.mm"
}

void Main::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScannerGoal_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_Internal.mm"
}
