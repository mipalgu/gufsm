//
// State_ReadyConnect.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_ReadyConnect.h"

#include "State_ReadyConnect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

ReadyConnect::ReadyConnect(const char *name): CLState(name, *new ReadyConnect::OnEntry, *new ReadyConnect::OnExit, *new ReadyConnect::Internal)
{
	_transitions[0] = new Transition_0();
}

ReadyConnect::~ReadyConnect()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ReadyConnect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_ReadyConnect_VarRefs.mm"
#	include "State_ReadyConnect_OnEntry.mm"
}

void ReadyConnect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_ReadyConnect_VarRefs.mm"
#	include "State_ReadyConnect_OnExit.mm"
}

void ReadyConnect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_ReadyConnect_VarRefs.mm"
#	include "State_ReadyConnect_Internal.mm"
}

bool ReadyConnect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_ReadyConnect_VarRefs.mm"

	return
	(
#		include "State_ReadyConnect_Transition_0.expr"
	);
}
