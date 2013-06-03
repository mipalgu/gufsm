//
// State_Default.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGetUp_Includes.h"
#include "SMGetUp.h"
#include "State_Default.h"

#include "State_Default_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGetUp;
using namespace State;

Default::Default(const char *name): CLState(name, *new Default::OnEntry, *new Default::OnExit, *new Default::Internal)
{
	_transitions[0] = new Transition_0();
}

Default::~Default()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Default::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Default_VarRefs.mm"
#	include "State_Default_OnEntry.mm"
}

void Default::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Default_VarRefs.mm"
#	include "State_Default_OnExit.mm"
}

void Default::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Default_VarRefs.mm"
#	include "State_Default_Internal.mm"
}

bool Default::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGetUp_VarRefs.mm"
#	include "State_Default_VarRefs.mm"

	return
	(
#		include "State_Default_Transition_0.expr"
	);
}
