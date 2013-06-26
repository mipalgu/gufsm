//
// State_readDistance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_readDistance.h"

#include "State_readDistance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

readDistance::readDistance(const char *name): CLState(name, *new readDistance::OnEntry, *new readDistance::OnExit, *new readDistance::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

readDistance::~readDistance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void readDistance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_readDistance_VarRefs.mm"
#	include "State_readDistance_OnEntry.mm"
}

void readDistance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_readDistance_VarRefs.mm"
#	include "State_readDistance_OnExit.mm"
}

void readDistance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_readDistance_VarRefs.mm"
#	include "State_readDistance_Internal.mm"
}

bool readDistance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_readDistance_VarRefs.mm"

	return
	(
#		include "State_readDistance_Transition_0.expr"
	);
}

bool readDistance::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_readDistance_VarRefs.mm"

	return
	(
#		include "State_readDistance_Transition_1.expr"
	);
}
