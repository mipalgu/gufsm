//
// State_Error.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"
#include "State_Error.h"

#include "State_Error_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnResume;
using namespace State;

Error::Error(const char *name): CLState(name, *new Error::OnEntry, *new Error::OnExit, *new Error::Internal, NULLPTR, new Error::OnSuspend, new Error::OnResume)
{
}

Error::~Error()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

}

void Error::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnEntry.mm"
}

void Error::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnExit.mm"
}

void Error::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_Internal.mm"
}

void Error::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnSuspend.mm"
}

void Error::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnResume.mm"
}
