//
// State_Reset_Again.mm -- 2013-04-12 00:14:38 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Reset_Again.h"

#include "State_Reset_Again_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Reset_Again::Reset_Again(const char *name): CLState(name, *new Reset_Again::OnEntry, *new Reset_Again::OnExit, *new Reset_Again::Internal)
{
	_transitions[0] = new Transition_0();
}

Reset_Again::~Reset_Again()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Reset_Again::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Again_VarRefs.mm"
#	include "State_Reset_Again_OnEntry.mm"
}

void Reset_Again::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Again_VarRefs.mm"
#	include "State_Reset_Again_OnExit.mm"
}

void Reset_Again::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Again_VarRefs.mm"
#	include "State_Reset_Again_Internal.mm"
}

bool Reset_Again::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Again_VarRefs.mm"

	return
	(
#		include "State_Reset_Again_Transition_0.expr"
	);
}
