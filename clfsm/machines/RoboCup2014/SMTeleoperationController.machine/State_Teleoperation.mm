//
// State_Teleoperation.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_Teleoperation.h"

#include "State_Teleoperation_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

Teleoperation::Teleoperation(const char *name): CLState(name, *new Teleoperation::OnEntry, *new Teleoperation::OnExit, *new Teleoperation::Internal)
{
	_transitions[0] = new Transition_0();
}

Teleoperation::~Teleoperation()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Teleoperation::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Teleoperation_VarRefs.mm"
#	include "State_Teleoperation_OnEntry.mm"
}

void Teleoperation::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Teleoperation_VarRefs.mm"
#	include "State_Teleoperation_OnExit.mm"
}

void Teleoperation::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Teleoperation_VarRefs.mm"
#	include "State_Teleoperation_Internal.mm"
}

bool Teleoperation::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Teleoperation_VarRefs.mm"

	return
	(
#		include "State_Teleoperation_Transition_0.expr"
	);
}
