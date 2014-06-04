//
// State_Walking.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"
#include "State_Walking.h"

#include "State_Walking_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationHeadControl;
using namespace State;

Walking::Walking(const char *name): CLState(name, *new Walking::OnEntry, *new Walking::OnExit, *new Walking::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Walking::~Walking()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Walking::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Walking_VarRefs.mm"
#	include "State_Walking_OnEntry.mm"
}

void Walking::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Walking_VarRefs.mm"
#	include "State_Walking_OnExit.mm"
}

void Walking::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Walking_VarRefs.mm"
#	include "State_Walking_Internal.mm"
}

bool Walking::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Walking_VarRefs.mm"

	return
	(
#		include "State_Walking_Transition_0.expr"
	);
}

bool Walking::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Walking_VarRefs.mm"

	return
	(
#		include "State_Walking_Transition_1.expr"
	);
}
