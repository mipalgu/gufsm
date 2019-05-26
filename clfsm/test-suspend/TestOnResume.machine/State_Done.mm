//
// State_Done.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestOnResume_Includes.h"
#include "TestOnResume.h"
#include "State_Done.h"

#include "State_Done_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMTestOnResume;
using namespace State;

Done::Done(const char *name): CLState(name, *new Done::OnEntry, *new Done::OnExit, *new Done::Internal, NULLPTR, new Done::OnSuspend, new Done::OnResume)
{
}

Done::~Done()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

}

void Done::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_FuncRefs.mm"
#	include "State_Done_OnEntry.mm"
}

void Done::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_FuncRefs.mm"
#	include "State_Done_OnExit.mm"
}

void Done::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_FuncRefs.mm"
#	include "State_Done_Internal.mm"
}

void Done::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_FuncRefs.mm"
#	include "State_Done_OnSuspend.mm"
}

void Done::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestOnResume_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "TestOnResume_FuncRefs.mm"
#	include "State_Done_FuncRefs.mm"
#	include "State_Done_OnResume.mm"
}
