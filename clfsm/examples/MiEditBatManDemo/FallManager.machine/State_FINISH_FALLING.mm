//
// State_FINISH_FALLING.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FallManager_Includes.h"
#include "FallManager.h"
#include "State_FINISH_FALLING.h"

#include "State_FINISH_FALLING_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFallManager;
using namespace State;

FINISH_FALLING::FINISH_FALLING(const char *name): CLState(name, *new FINISH_FALLING::OnEntry, *new FINISH_FALLING::OnExit, *new FINISH_FALLING::Internal)
{
	_transitions[0] = new Transition_0();
}

FINISH_FALLING::~FINISH_FALLING()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FINISH_FALLING::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_FINISH_FALLING_VarRefs.mm"
#	include "State_FINISH_FALLING_OnEntry.mm"
}

void FINISH_FALLING::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_FINISH_FALLING_VarRefs.mm"
#	include "State_FINISH_FALLING_OnExit.mm"
}

void FINISH_FALLING::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_FINISH_FALLING_VarRefs.mm"
#	include "State_FINISH_FALLING_Internal.mm"
}

bool FINISH_FALLING::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_FINISH_FALLING_VarRefs.mm"

	return
	(
#		include "State_FINISH_FALLING_Transition_0.expr"
	);
}
