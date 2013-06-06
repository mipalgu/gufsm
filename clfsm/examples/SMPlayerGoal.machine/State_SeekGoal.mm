//
// State_SeekGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"
#include "State_SeekGoal.h"

#include "State_SeekGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayerGoal;
using namespace State;

SeekGoal::SeekGoal(const char *name): CLState(name, *new SeekGoal::OnEntry, *new SeekGoal::OnExit, *new SeekGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

SeekGoal::~SeekGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SeekGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_SeekGoal_VarRefs.mm"
#	include "State_SeekGoal_OnEntry.mm"
}

void SeekGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_SeekGoal_VarRefs.mm"
#	include "State_SeekGoal_OnExit.mm"
}

void SeekGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_SeekGoal_VarRefs.mm"
#	include "State_SeekGoal_Internal.mm"
}

bool SeekGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_SeekGoal_VarRefs.mm"

	return
	(
#		include "State_SeekGoal_Transition_0.expr"
	);
}
