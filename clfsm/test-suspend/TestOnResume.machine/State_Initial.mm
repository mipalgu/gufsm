//
// State_Initial.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnResume;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal, NULLPTR, new Initial::OnSuspend, new Initial::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

void Initial::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnSuspend.mm"
}

void Initial::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnResume.mm"
}

bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}

bool Initial::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_1.expr"
	);
}
