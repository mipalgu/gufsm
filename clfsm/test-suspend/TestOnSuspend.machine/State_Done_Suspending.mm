//
// State_Done_Suspending.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnSuspend_Includes.h"
#include "TestOnSuspend.h"
#include "State_Done_Suspending.h"

#include "State_Done_Suspending_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnSuspend;
using namespace State;

Done_Suspending::Done_Suspending(const char *name): CLState(name, *new Done_Suspending::OnEntry, *new Done_Suspending::OnExit, *new Done_Suspending::Internal, NULLPTR, new Done_Suspending::OnSuspend)
{
}

Done_Suspending::~Done_Suspending()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();

}

void Done_Suspending::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnSuspend_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnSuspend_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnEntry.mm"
}

void Done_Suspending::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnSuspend_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnSuspend_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnExit.mm"
}

void Done_Suspending::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnSuspend_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnSuspend_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_Internal.mm"
}

void Done_Suspending::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnSuspend_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnSuspend_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnSuspend.mm"
}
