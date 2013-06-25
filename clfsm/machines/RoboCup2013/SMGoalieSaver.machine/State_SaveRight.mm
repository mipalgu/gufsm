//
// State_SaveRight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_SaveRight.h"

#include "State_SaveRight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

SaveRight::SaveRight(const char *name): CLState(name, *new SaveRight::OnEntry, *new SaveRight::OnExit, *new SaveRight::Internal)
{
	_transitions[0] = new Transition_0();
}

SaveRight::~SaveRight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SaveRight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveRight_VarRefs.mm"
#	include "State_SaveRight_OnEntry.mm"
}

void SaveRight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveRight_VarRefs.mm"
#	include "State_SaveRight_OnExit.mm"
}

void SaveRight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveRight_VarRefs.mm"
#	include "State_SaveRight_Internal.mm"
}

bool SaveRight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveRight_VarRefs.mm"

	return
	(
#		include "State_SaveRight_Transition_0.expr"
	);
}
