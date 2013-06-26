//
// State_SearchGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_SearchGoal.h"

#include "State_SearchGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

SearchGoal::SearchGoal(const char *name): CLState(name, *new SearchGoal::OnEntry, *new SearchGoal::OnExit, *new SearchGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

SearchGoal::~SearchGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SearchGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SearchGoal_VarRefs.mm"
#	include "State_SearchGoal_OnEntry.mm"
}

void SearchGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SearchGoal_VarRefs.mm"
#	include "State_SearchGoal_OnExit.mm"
}

void SearchGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SearchGoal_VarRefs.mm"
#	include "State_SearchGoal_Internal.mm"
}

bool SearchGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_SearchGoal_VarRefs.mm"

	return
	(
#		include "State_SearchGoal_Transition_0.expr"
	);
}
