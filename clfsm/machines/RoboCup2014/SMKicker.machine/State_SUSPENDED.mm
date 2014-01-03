//
// State_SUSPENDED.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_SUSPENDED.h"

#include "State_SUSPENDED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
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
#	include "SMKicker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_SUSPENDED_VarRefs.mm"
#	include "State_SUSPENDED_Internal.mm"
}
