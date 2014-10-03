//
// State_GET_UP_FINISHED.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FallManager_Includes.h"
#include "FallManager.h"
#include "State_GET_UP_FINISHED.h"

#include "State_GET_UP_FINISHED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFallManager;
using namespace State;

GET_UP_FINISHED::GET_UP_FINISHED(const char *name): CLState(name, *new GET_UP_FINISHED::OnEntry, *new GET_UP_FINISHED::OnExit, *new GET_UP_FINISHED::Internal)
{
	_transitions[0] = new Transition_0();
}

GET_UP_FINISHED::~GET_UP_FINISHED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GET_UP_FINISHED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_GET_UP_FINISHED_VarRefs.mm"
#	include "State_GET_UP_FINISHED_OnEntry.mm"
}

void GET_UP_FINISHED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_GET_UP_FINISHED_VarRefs.mm"
#	include "State_GET_UP_FINISHED_OnExit.mm"
}

void GET_UP_FINISHED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_GET_UP_FINISHED_VarRefs.mm"
#	include "State_GET_UP_FINISHED_Internal.mm"
}

bool GET_UP_FINISHED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_GET_UP_FINISHED_VarRefs.mm"

	return
	(
#		include "State_GET_UP_FINISHED_Transition_0.expr"
	);
}
