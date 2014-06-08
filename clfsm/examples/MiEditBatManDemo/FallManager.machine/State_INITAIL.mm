//
// State_INITAIL.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "FallManager_Includes.h"
#include "FallManager.h"
#include "State_INITAIL.h"

#include "State_INITAIL_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFallManager;
using namespace State;

INITAIL::INITAIL(const char *name): CLState(name, *new INITAIL::OnEntry, *new INITAIL::OnExit, *new INITAIL::Internal)
{
	_transitions[0] = new Transition_0();
}

INITAIL::~INITAIL()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void INITAIL::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_INITAIL_VarRefs.mm"
#	include "State_INITAIL_OnEntry.mm"
}

void INITAIL::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_INITAIL_VarRefs.mm"
#	include "State_INITAIL_OnExit.mm"
}

void INITAIL::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_INITAIL_VarRefs.mm"
#	include "State_INITAIL_Internal.mm"
}

bool INITAIL::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FallManager_VarRefs.mm"
#	include "State_INITAIL_VarRefs.mm"

	return
	(
#		include "State_INITAIL_Transition_0.expr"
	);
}
