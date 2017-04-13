//
// State_Delete_Testfile.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Suspend_Includes.h"
#include "Suspend.h"
#include "State_Delete_Testfile.h"

#include "State_Delete_Testfile_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspend;
using namespace State;

Delete_Testfile::Delete_Testfile(const char *name): CLState(name, *new Delete_Testfile::OnEntry, *new Delete_Testfile::OnExit, *new Delete_Testfile::Internal)
{
	_transitions[0] = new Transition_0();
}

Delete_Testfile::~Delete_Testfile()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Delete_Testfile::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Delete_Testfile_VarRefs.mm"
#	include "State_Delete_Testfile_OnEntry.mm"
}

void Delete_Testfile::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Delete_Testfile_VarRefs.mm"
#	include "State_Delete_Testfile_OnExit.mm"
}

void Delete_Testfile::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Delete_Testfile_VarRefs.mm"
#	include "State_Delete_Testfile_Internal.mm"
}

bool Delete_Testfile::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Suspend_VarRefs.mm"
#	include "State_Delete_Testfile_VarRefs.mm"

	return
	(
#		include "State_Delete_Testfile_Transition_0.expr"
	);
}
