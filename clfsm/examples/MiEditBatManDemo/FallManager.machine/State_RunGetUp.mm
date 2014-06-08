//
// State_RunGetUp.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FallManager_Includes.h"
#include "FallManager.h"
#include "State_RunGetUp.h"

#include "State_RunGetUp_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFallManager;
using namespace State;

RunGetUp::RunGetUp(const char *name): CLState(name, *new RunGetUp::OnEntry, *new RunGetUp::OnExit, *new RunGetUp::Internal)
{
	_transitions[0] = new Transition_0();
}

RunGetUp::~RunGetUp()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RunGetUp::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_RunGetUp_VarRefs.mm"
#	include "State_RunGetUp_OnEntry.mm"
}

void RunGetUp::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_RunGetUp_VarRefs.mm"
#	include "State_RunGetUp_OnExit.mm"
}

void RunGetUp::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_RunGetUp_VarRefs.mm"
#	include "State_RunGetUp_Internal.mm"
}

bool RunGetUp::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_RunGetUp_VarRefs.mm"

	return
	(
#		include "State_RunGetUp_Transition_0.expr"
	);
}
