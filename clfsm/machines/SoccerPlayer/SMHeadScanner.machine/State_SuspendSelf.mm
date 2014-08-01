//
// State_SuspendSelf.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_SuspendSelf.h"

#include "State_SuspendSelf_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScanner;
using namespace State;

SuspendSelf::SuspendSelf(const char *name): CLState(name, *new SuspendSelf::OnEntry, *new SuspendSelf::OnExit, *new SuspendSelf::Internal)
{
}

SuspendSelf::~SuspendSelf()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SuspendSelf::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_SuspendSelf_VarRefs.mm"
#	include "State_SuspendSelf_OnEntry.mm"
}

void SuspendSelf::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_SuspendSelf_VarRefs.mm"
#	include "State_SuspendSelf_OnExit.mm"
}

void SuspendSelf::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_SuspendSelf_VarRefs.mm"
#	include "State_SuspendSelf_Internal.mm"
}
