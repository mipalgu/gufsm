//
// State_Action.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_Action.h"

#include "State_Action_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

Action::Action(const char *name): CLState(name, *new Action::OnEntry, *new Action::OnExit, *new Action::Internal)
{
	_transitions[0] = new Transition_0();
}

Action::~Action()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Action::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Action_VarRefs.mm"
#	include "State_Action_OnEntry.mm"
}

void Action::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Action_VarRefs.mm"
#	include "State_Action_OnExit.mm"
}

void Action::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Action_VarRefs.mm"
#	include "State_Action_Internal.mm"
}

bool Action::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Action_VarRefs.mm"

	return
	(
#		include "State_Action_Transition_0.expr"
	);
}
