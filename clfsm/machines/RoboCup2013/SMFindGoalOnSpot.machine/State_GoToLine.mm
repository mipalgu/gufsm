//
// State_GoToLine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFindGoalOnSpot_Includes.h"
#include "SMFindGoalOnSpot.h"
#include "State_GoToLine.h"

#include "State_GoToLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFindGoalOnSpot;
using namespace State;

GoToLine::GoToLine(const char *name): CLState(name, *new GoToLine::OnEntry, *new GoToLine::OnExit, *new GoToLine::Internal)
{
	_transitions[0] = new Transition_0();
}

GoToLine::~GoToLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GoToLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_OnEntry.mm"
}

void GoToLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_OnExit.mm"
}

void GoToLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_Internal.mm"
}

bool GoToLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"

	return
	(
#		include "State_GoToLine_Transition_0.expr"
	);
}
