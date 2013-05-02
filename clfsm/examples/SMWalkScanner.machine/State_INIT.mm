//
// State_INIT.mm -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_INIT.h"

#include "State_INIT_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

INIT::INIT(const char *name): CLState(name, *new INIT::OnEntry, *new INIT::OnExit, *new INIT::Internal)
{
	_transitions[0] = new Transition_0();
}

INIT::~INIT()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void INIT::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_OnEntry.mm"
}

void INIT::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_OnExit.mm"
}

void INIT::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"
#	include "State_INIT_Internal.mm"
}

bool INIT::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_INIT_VarRefs.mm"

	return
	(
#		include "State_INIT_Transition_0.expr"
	);
}
