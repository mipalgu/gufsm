//
// State_CheckStance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"
#include "State_CheckStance.h"

#include "State_CheckStance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFallManager;
using namespace State;

CheckStance::CheckStance(const char *name): CLState(name, *new CheckStance::OnEntry, *new CheckStance::OnExit, *new CheckStance::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckStance::~CheckStance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckStance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_CheckStance_VarRefs.mm"
#	include "State_CheckStance_OnEntry.mm"
}

void CheckStance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_CheckStance_VarRefs.mm"
#	include "State_CheckStance_OnExit.mm"
}

void CheckStance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_CheckStance_VarRefs.mm"
#	include "State_CheckStance_Internal.mm"
}

bool CheckStance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_CheckStance_VarRefs.mm"

	return
	(
#		include "State_CheckStance_Transition_0.expr"
	);
}

bool CheckStance::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_CheckStance_VarRefs.mm"

	return
	(
#		include "State_CheckStance_Transition_1.expr"
	);
}
