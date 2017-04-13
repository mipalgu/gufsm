//
// State_Exit.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "MultiMachine_Includes.h"
#include "MultiMachine.h"
#include "State_Exit.h"

#include "State_Exit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMultiMachine;
using namespace State;

Exit::Exit(const char *name): CLState(name, *new Exit::OnEntry, *new Exit::OnExit, *new Exit::Internal)
{
}

Exit::~Exit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Exit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_Exit_VarRefs.mm"
#	include "State_Exit_OnEntry.mm"
}

void Exit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_Exit_VarRefs.mm"
#	include "State_Exit_OnExit.mm"
}

void Exit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MultiMachine_VarRefs.mm"
#	include "State_Exit_VarRefs.mm"
#	include "State_Exit_Internal.mm"
}
