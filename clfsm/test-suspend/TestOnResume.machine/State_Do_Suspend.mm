//
// State_Do_Suspend.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"
#include "State_Do_Suspend.h"

#include "State_Do_Suspend_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnResume;
using namespace State;

Do_Suspend::Do_Suspend(const char *name): CLState(name, *new Do_Suspend::OnEntry, *new Do_Suspend::OnExit, *new Do_Suspend::Internal, NULLPTR, new Do_Suspend::OnSuspend, new Do_Suspend::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Do_Suspend::~Do_Suspend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Do_Suspend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"
#	include "State_Do_Suspend_OnEntry.mm"
}

void Do_Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"
#	include "State_Do_Suspend_OnExit.mm"
}

void Do_Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"
#	include "State_Do_Suspend_Internal.mm"
}

void Do_Suspend::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"
#	include "State_Do_Suspend_OnSuspend.mm"
}

void Do_Suspend::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"
#	include "State_Do_Suspend_OnResume.mm"
}

bool Do_Suspend::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"

	return
	(
#		include "State_Do_Suspend_Transition_0.expr"
	);
}

bool Do_Suspend::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Do_Suspend_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Do_Suspend_FuncRefs.mm"

	return
	(
#		include "State_Do_Suspend_Transition_1.expr"
	);
}
