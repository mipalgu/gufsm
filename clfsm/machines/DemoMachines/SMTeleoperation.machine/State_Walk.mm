//
// State_Walk.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Walk.h"

#include "State_Walk_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Walk::Walk(const char *name): CLState(name, *new Walk::OnEntry, *new Walk::OnExit, *new Walk::Internal)
{
	_transitions[0] = new Transition_0();
}

Walk::~Walk()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Walk::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Walk_VarRefs.mm"
#	include "State_Walk_OnEntry.mm"
}

void Walk::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Walk_VarRefs.mm"
#	include "State_Walk_OnExit.mm"
}

void Walk::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Walk_VarRefs.mm"
#	include "State_Walk_Internal.mm"
}

bool Walk::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Walk_VarRefs.mm"

	return
	(
#		include "State_Walk_Transition_0.expr"
	);
}
