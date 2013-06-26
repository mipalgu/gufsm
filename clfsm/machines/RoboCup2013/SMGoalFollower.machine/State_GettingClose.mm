//
// State_GettingClose.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalFollower_Includes.h"
#include "SMGoalFollower.h"
#include "State_GettingClose.h"

#include "State_GettingClose_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalFollower;
using namespace State;

GettingClose::GettingClose(const char *name): CLState(name, *new GettingClose::OnEntry, *new GettingClose::OnExit, *new GettingClose::Internal)
{
}

GettingClose::~GettingClose()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void GettingClose::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_GettingClose_VarRefs.mm"
#	include "State_GettingClose_OnEntry.mm"
}

void GettingClose::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_GettingClose_VarRefs.mm"
#	include "State_GettingClose_OnExit.mm"
}

void GettingClose::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalFollower_VarRefs.mm"
#	include "State_GettingClose_VarRefs.mm"
#	include "State_GettingClose_Internal.mm"
}
