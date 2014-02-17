//
// State_Dummy.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"
#include "State_Dummy.h"

#include "State_Dummy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationHeadControl;
using namespace State;

Dummy::Dummy(const char *name): CLState(name, *new Dummy::OnEntry, *new Dummy::OnExit, *new Dummy::Internal)
{
	_transitions[0] = new Transition_0();
}

Dummy::~Dummy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Dummy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_OnEntry.mm"
}

void Dummy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_OnExit.mm"
}

void Dummy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"
#	include "State_Dummy_Internal.mm"
}

bool Dummy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_Dummy_VarRefs.mm"

	return
	(
#		include "State_Dummy_Transition_0.expr"
	);
}
