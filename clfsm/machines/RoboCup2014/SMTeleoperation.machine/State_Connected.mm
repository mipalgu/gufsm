//
// State_Connected.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Connected.h"

#include "State_Connected_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Connected::Connected(const char *name): CLState(name, *new Connected::OnEntry, *new Connected::OnExit, *new Connected::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Connected::~Connected()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Connected::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Connected_VarRefs.mm"
#	include "State_Connected_OnEntry.mm"
}

void Connected::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Connected_VarRefs.mm"
#	include "State_Connected_OnExit.mm"
}

void Connected::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Connected_VarRefs.mm"
#	include "State_Connected_Internal.mm"
}

bool Connected::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Connected_VarRefs.mm"

	return
	(
#		include "State_Connected_Transition_0.expr"
	);
}

bool Connected::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Connected_VarRefs.mm"

	return
	(
#		include "State_Connected_Transition_1.expr"
	);
}
