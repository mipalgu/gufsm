//
// State_WalkEngineStance.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"
#include "State_WalkEngineStance.h"

#include "State_WalkEngineStance_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFallManager;
using namespace State;

WalkEngineStance::WalkEngineStance(const char *name): CLState(name, *new WalkEngineStance::OnEntry, *new WalkEngineStance::OnExit, *new WalkEngineStance::Internal)
{
	_transitions[0] = new Transition_0();
}

WalkEngineStance::~WalkEngineStance()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WalkEngineStance::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_WalkEngineStance_VarRefs.mm"
#	include "State_WalkEngineStance_OnEntry.mm"
}

void WalkEngineStance::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_WalkEngineStance_VarRefs.mm"
#	include "State_WalkEngineStance_OnExit.mm"
}

void WalkEngineStance::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_WalkEngineStance_VarRefs.mm"
#	include "State_WalkEngineStance_Internal.mm"
}

bool WalkEngineStance::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_WalkEngineStance_VarRefs.mm"

	return
	(
#		include "State_WalkEngineStance_Transition_0.expr"
	);
}
