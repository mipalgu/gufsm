//
// State_SUSPENDED.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_SUSPENDED.h"

#include "State_SUSPENDED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_Internal.mm"
}
