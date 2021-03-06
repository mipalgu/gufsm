//
// State_Done_Suspending.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"
#include "State_Done_Suspending.h"

#include "State_Done_Suspending_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnResume;
using namespace State;

Done_Suspending::Done_Suspending(const char *name): CLState(name, *new Done_Suspending::OnEntry, *new Done_Suspending::OnExit, *new Done_Suspending::Internal, NULLPTR, new Done_Suspending::OnSuspend, new Done_Suspending::OnResume)
{
	_transitions[0] = new Transition_0();
}

Done_Suspending::~Done_Suspending()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void Done_Suspending::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnEntry.mm"
}

void Done_Suspending::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnExit.mm"
}

void Done_Suspending::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_Internal.mm"
}

void Done_Suspending::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnSuspend.mm"
}

void Done_Suspending::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"
#	include "State_Done_Suspending_OnResume.mm"
}

bool Done_Suspending::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_Suspending_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_Suspending_FuncRefs.mm"

	return
	(
#		include "State_Done_Suspending_Transition_0.expr"
	);
}
