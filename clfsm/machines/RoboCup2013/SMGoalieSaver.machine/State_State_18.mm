//
// State_State_18.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_State_18.h"

#include "State_State_18_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

State_18::State_18(const char *name): CLState(name, *new State_18::OnEntry, *new State_18::OnExit, *new State_18::Internal)
{
}

State_18::~State_18()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void State_18::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_State_18_VarRefs.mm"
#	include "State_State_18_OnEntry.mm"
}

void State_18::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_State_18_VarRefs.mm"
#	include "State_State_18_OnExit.mm"
}

void State_18::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_State_18_VarRefs.mm"
#	include "State_State_18_Internal.mm"
}
