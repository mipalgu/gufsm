//
// State_StopSensing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"
#include "State_StopSensing.h"

#include "State_StopSensing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFallManager;
using namespace State;

StopSensing::StopSensing(const char *name): CLState(name, *new StopSensing::OnEntry, *new StopSensing::OnExit, *new StopSensing::Internal)
{
	_transitions[0] = new Transition_0();
}

StopSensing::~StopSensing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StopSensing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_StopSensing_VarRefs.mm"
#	include "State_StopSensing_OnEntry.mm"
}

void StopSensing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_StopSensing_VarRefs.mm"
#	include "State_StopSensing_OnExit.mm"
}

void StopSensing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_StopSensing_VarRefs.mm"
#	include "State_StopSensing_Internal.mm"
}

bool StopSensing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_StopSensing_VarRefs.mm"

	return
	(
#		include "State_StopSensing_Transition_0.expr"
	);
}
