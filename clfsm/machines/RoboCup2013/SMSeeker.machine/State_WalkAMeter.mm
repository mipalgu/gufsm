//
// State_WalkAMeter.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_WalkAMeter.h"

#include "State_WalkAMeter_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

WalkAMeter::WalkAMeter(const char *name): CLState(name, *new WalkAMeter::OnEntry, *new WalkAMeter::OnExit, *new WalkAMeter::Internal)
{
}

WalkAMeter::~WalkAMeter()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void WalkAMeter::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkAMeter_VarRefs.mm"
#	include "State_WalkAMeter_OnEntry.mm"
}

void WalkAMeter::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkAMeter_VarRefs.mm"
#	include "State_WalkAMeter_OnExit.mm"
}

void WalkAMeter::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkAMeter_VarRefs.mm"
#	include "State_WalkAMeter_Internal.mm"
}
