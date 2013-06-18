//
// State_Stop.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_Stop.h"

#include "State_Stop_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

Stop::Stop(const char *name): CLState(name, *new Stop::OnEntry, *new Stop::OnExit, *new Stop::Internal)
{
}

Stop::~Stop()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Stop::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Stop_VarRefs.mm"
#	include "State_Stop_OnEntry.mm"
}

void Stop::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Stop_VarRefs.mm"
#	include "State_Stop_OnExit.mm"
}

void Stop::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Stop_VarRefs.mm"
#	include "State_Stop_Internal.mm"
}
