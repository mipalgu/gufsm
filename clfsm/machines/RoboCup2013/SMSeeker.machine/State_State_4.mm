//
// State_State_4.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_State_4.h"

#include "State_State_4_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

State_4::State_4(const char *name): CLState(name, *new State_4::OnEntry, *new State_4::OnExit, *new State_4::Internal)
{
}

State_4::~State_4()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void State_4::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_State_4_VarRefs.mm"
#	include "State_State_4_OnEntry.mm"
}

void State_4::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_State_4_VarRefs.mm"
#	include "State_State_4_OnExit.mm"
}

void State_4::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_State_4_VarRefs.mm"
#	include "State_State_4_Internal.mm"
}
