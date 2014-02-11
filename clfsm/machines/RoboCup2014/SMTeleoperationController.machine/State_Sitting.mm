//
// State_Sitting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_Sitting.h"

#include "State_Sitting_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

Sitting::Sitting(const char *name): CLState(name, *new Sitting::OnEntry, *new Sitting::OnExit, *new Sitting::Internal)
{
	_transitions[0] = new Transition_0();
}

Sitting::~Sitting()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Sitting::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Sitting_VarRefs.mm"
#	include "State_Sitting_OnEntry.mm"
}

void Sitting::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Sitting_VarRefs.mm"
#	include "State_Sitting_OnExit.mm"
}

void Sitting::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Sitting_VarRefs.mm"
#	include "State_Sitting_Internal.mm"
}

bool Sitting::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Sitting_VarRefs.mm"

	return
	(
#		include "State_Sitting_Transition_0.expr"
	);
}
