//
// State_Zero.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonLeftFoot_Includes.h"
#include "SMButtonLeftFoot.h"
#include "State_Zero.h"

#include "State_Zero_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMButtonLeftFoot;
using namespace State;

Zero::Zero(const char *name): CLState(name, *new Zero::OnEntry, *new Zero::OnExit, *new Zero::Internal)
{
	_transitions[0] = new Transition_0();
}

Zero::~Zero()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Zero::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonLeftFoot_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "State_Zero_OnEntry.mm"
}

void Zero::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonLeftFoot_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "State_Zero_OnExit.mm"
}

void Zero::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonLeftFoot_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "State_Zero_Internal.mm"
}

bool Zero::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonLeftFoot_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"

	return
	(
#		include "State_Zero_Transition_0.expr"
	);
}
