//
// State_End.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "CLReflectDemo_Includes.h"
#include "CLReflectDemo.h"
#include "State_End.h"

#include "State_End_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMCLReflectDemo;
using namespace State;

End::End(const char *name): CLState(name, *new End::OnEntry, *new End::OnExit, *new End::Internal)
{
}

End::~End()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void End::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_End_VarRefs.mm"
#	include "State_End_OnEntry.mm"
}

void End::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_End_VarRefs.mm"
#	include "State_End_OnExit.mm"
}

void End::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "CLReflectDemo_VarRefs.mm"
#	include "State_End_VarRefs.mm"
#	include "State_End_Internal.mm"
}
