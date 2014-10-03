//
//State_OTHER.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "TestSuspend_Includes.h"
#include "TestSuspend.h"

#include "State_OTHER.h"
#include "State_OTHER_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTestSuspend;
using namespace State;

OTHER::OTHER(const char *name):CLState(name, *new OTHER::OnEntry,*new OTHER::OnExit, *new OTHER::Internal)
{
	_transitions[0] = new Transition_0();
}

OTHER::~OTHER()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void OTHER::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_OTHER_VarRefs.mm"
#	include "State_OTHER_OnEntry.mm"
}

void OTHER::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_OTHER_VarRefs.mm"
#	include "State_OTHER_OnExit.mm"
}

void OTHER::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_OTHER_VarRefs.mm"
#	include "State_OTHER_Internal.mm"
}

bool OTHER::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestSuspend_VarRefs.mm"
#	include "State_OTHER_VarRefs.mm"

	return
	(
#			include "State_OTHER_Transition_0.expr"
	);
}


