//
// State_ActionStance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_ActionStance.h"

#include "State_ActionStance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

ActionStance::ActionStance(const char *name): CLState(name, *new ActionStance::OnEntry, *new ActionStance::OnExit, *new ActionStance::Internal)
{
	_transitions[0] = new Transition_0();
}

ActionStance::~ActionStance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ActionStance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_ActionStance_VarRefs.mm"
#	include "State_ActionStance_OnEntry.mm"
}

void ActionStance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_ActionStance_VarRefs.mm"
#	include "State_ActionStance_OnExit.mm"
}

void ActionStance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_ActionStance_VarRefs.mm"
#	include "State_ActionStance_Internal.mm"
}

bool ActionStance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_ActionStance_VarRefs.mm"

	return
	(
#		include "State_ActionStance_Transition_0.expr"
	);
}
