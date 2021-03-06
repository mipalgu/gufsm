//
// State_Forward.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "OdometryTesting_Includes.h"
#include "OdometryTesting.h"
#include "State_Forward.h"

#include "State_Forward_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMOdometryTesting;
using namespace State;

Forward::Forward(const char *name): CLState(name, *new Forward::OnEntry, *new Forward::OnExit, *new Forward::Internal)
{
	_transitions[0] = new Transition_0();
}

Forward::~Forward()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Forward::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OdometryTesting_VarRefs.mm"
#	include "State_Forward_VarRefs.mm"
#	include "State_Forward_OnEntry.mm"
}

void Forward::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OdometryTesting_VarRefs.mm"
#	include "State_Forward_VarRefs.mm"
#	include "State_Forward_OnExit.mm"
}

void Forward::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OdometryTesting_VarRefs.mm"
#	include "State_Forward_VarRefs.mm"
#	include "State_Forward_Internal.mm"
}

bool Forward::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "OdometryTesting_VarRefs.mm"
#	include "State_Forward_VarRefs.mm"

	return
	(
#		include "State_Forward_Transition_0.expr"
	);
}
