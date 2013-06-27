//
// State_checkDistance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_checkDistance.h"

#include "State_checkDistance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

checkDistance::checkDistance(const char *name): CLState(name, *new checkDistance::OnEntry, *new checkDistance::OnExit, *new checkDistance::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

checkDistance::~checkDistance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void checkDistance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"
#	include "State_checkDistance_OnEntry.mm"
}

void checkDistance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"
#	include "State_checkDistance_OnExit.mm"
}

void checkDistance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"
#	include "State_checkDistance_Internal.mm"
}

bool checkDistance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"

	return
	(
#		include "State_checkDistance_Transition_0.expr"
	);
}

bool checkDistance::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"

	return
	(
#		include "State_checkDistance_Transition_1.expr"
	);
}

bool checkDistance::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistance_VarRefs.mm"

	return
	(
#		include "State_checkDistance_Transition_2.expr"
	);
}
