//
// State_Wait_Unwobble.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"
#include "State_Wait_Unwobble.h"

#include "State_Wait_Unwobble_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFallManager;
using namespace State;

Wait_Unwobble::Wait_Unwobble(const char *name): CLState(name, *new Wait_Unwobble::OnEntry, *new Wait_Unwobble::OnExit, *new Wait_Unwobble::Internal)
{
	_transitions[0] = new Transition_0();
}

Wait_Unwobble::~Wait_Unwobble()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Wait_Unwobble::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_Wait_Unwobble_VarRefs.mm"
#	include "State_Wait_Unwobble_OnEntry.mm"
}

void Wait_Unwobble::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_Wait_Unwobble_VarRefs.mm"
#	include "State_Wait_Unwobble_OnExit.mm"
}

void Wait_Unwobble::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_Wait_Unwobble_VarRefs.mm"
#	include "State_Wait_Unwobble_Internal.mm"
}

bool Wait_Unwobble::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_Wait_Unwobble_VarRefs.mm"

	return
	(
#		include "State_Wait_Unwobble_Transition_0.expr"
	);
}
