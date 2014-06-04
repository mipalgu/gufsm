//
// State_Disconnect.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Disconnect.h"

#include "State_Disconnect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Disconnect::Disconnect(const char *name): CLState(name, *new Disconnect::OnEntry, *new Disconnect::OnExit, *new Disconnect::Internal)
{
	_transitions[0] = new Transition_0();
}

Disconnect::~Disconnect()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Disconnect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Disconnect_VarRefs.mm"
#	include "State_Disconnect_OnEntry.mm"
}

void Disconnect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Disconnect_VarRefs.mm"
#	include "State_Disconnect_OnExit.mm"
}

void Disconnect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Disconnect_VarRefs.mm"
#	include "State_Disconnect_Internal.mm"
}

bool Disconnect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Disconnect_VarRefs.mm"

	return
	(
#		include "State_Disconnect_Transition_0.expr"
	);
}
