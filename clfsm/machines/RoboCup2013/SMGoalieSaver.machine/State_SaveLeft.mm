//
// State_SaveLeft.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_SaveLeft.h"

#include "State_SaveLeft_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

SaveLeft::SaveLeft(const char *name): CLState(name, *new SaveLeft::OnEntry, *new SaveLeft::OnExit, *new SaveLeft::Internal)
{
	_transitions[0] = new Transition_0();
}

SaveLeft::~SaveLeft()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SaveLeft::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveLeft_VarRefs.mm"
#	include "State_SaveLeft_OnEntry.mm"
}

void SaveLeft::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveLeft_VarRefs.mm"
#	include "State_SaveLeft_OnExit.mm"
}

void SaveLeft::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveLeft_VarRefs.mm"
#	include "State_SaveLeft_Internal.mm"
}

bool SaveLeft::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveLeft_VarRefs.mm"

	return
	(
#		include "State_SaveLeft_Transition_0.expr"
	);
}
