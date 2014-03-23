//
// State_Standing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Standing.h"

#include "State_Standing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Standing::Standing(const char *name): CLState(name, *new Standing::OnEntry, *new Standing::OnExit, *new Standing::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
}

Standing::~Standing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
}

void Standing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_OnEntry.mm"
}

void Standing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_OnExit.mm"
}

void Standing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"
#	include "State_Standing_Internal.mm"
}

bool Standing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"

	return
	(
#		include "State_Standing_Transition_0.expr"
	);
}

bool Standing::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"

	return
	(
#		include "State_Standing_Transition_1.expr"
	);
}

bool Standing::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"

	return
	(
#		include "State_Standing_Transition_2.expr"
	);
}

bool Standing::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Standing_VarRefs.mm"

	return
	(
#		include "State_Standing_Transition_3.expr"
	);
}