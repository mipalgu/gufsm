//
// State_ResumeSensing.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFallManager_Includes.h"
#include "SMFallManager.h"
#include "State_ResumeSensing.h"

#include "State_ResumeSensing_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFallManager;
using namespace State;

ResumeSensing::ResumeSensing(const char *name): CLState(name, *new ResumeSensing::OnEntry, *new ResumeSensing::OnExit, *new ResumeSensing::Internal)
{
	_transitions[0] = new Transition_0();
}

ResumeSensing::~ResumeSensing()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ResumeSensing::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_ResumeSensing_VarRefs.mm"
#	include "State_ResumeSensing_OnEntry.mm"
}

void ResumeSensing::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_ResumeSensing_VarRefs.mm"
#	include "State_ResumeSensing_OnExit.mm"
}

void ResumeSensing::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_ResumeSensing_VarRefs.mm"
#	include "State_ResumeSensing_Internal.mm"
}

bool ResumeSensing::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFallManager_VarRefs.mm"
#	include "State_ResumeSensing_VarRefs.mm"

	return
	(
#		include "State_ResumeSensing_Transition_0.expr"
	);
}
