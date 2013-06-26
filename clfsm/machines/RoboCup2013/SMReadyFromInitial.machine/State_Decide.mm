//
// State_Decide.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_Decide.h"

#include "State_Decide_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

Decide::Decide(const char *name): CLState(name, *new Decide::OnEntry, *new Decide::OnExit, *new Decide::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Decide::~Decide()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Decide::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Decide_VarRefs.mm"
#	include "State_Decide_OnEntry.mm"
}

void Decide::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Decide_VarRefs.mm"
#	include "State_Decide_OnExit.mm"
}

void Decide::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Decide_VarRefs.mm"
#	include "State_Decide_Internal.mm"
}

bool Decide::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Decide_VarRefs.mm"

	return
	(
#		include "State_Decide_Transition_0.expr"
	);
}

bool Decide::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Decide_VarRefs.mm"

	return
	(
#		include "State_Decide_Transition_1.expr"
	);
}
