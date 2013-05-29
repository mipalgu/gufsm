//
// State_Finished.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Finished.h"

#include "State_Finished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Finished::Finished(const char *name): CLState(name, *new Finished::OnEntry, *new Finished::OnExit, *new Finished::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Finished::~Finished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Finished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_OnEntry.mm"
}

void Finished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_OnExit.mm"
}

void Finished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"
#	include "State_Finished_Internal.mm"
}

bool Finished::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"

	return
	(
#		include "State_Finished_Transition_0.expr"
	);
}

bool Finished::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"

	return
	(
#		include "State_Finished_Transition_1.expr"
	);
}

bool Finished::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Finished_VarRefs.mm"

	return
	(
#		include "State_Finished_Transition_2.expr"
	);
}
