//
// State_Sit.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Sit.h"

#include "State_Sit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Sit::Sit(const char *name): CLState(name, *new Sit::OnEntry, *new Sit::OnExit, *new Sit::Internal)
{
	_transitions[0] = new Transition_0();
}

Sit::~Sit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Sit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Sit_VarRefs.mm"
#	include "State_Sit_OnEntry.mm"
}

void Sit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Sit_VarRefs.mm"
#	include "State_Sit_OnExit.mm"
}

void Sit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Sit_VarRefs.mm"
#	include "State_Sit_Internal.mm"
}

bool Sit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Sit_VarRefs.mm"

	return
	(
#		include "State_Sit_Transition_0.expr"
	);
}
