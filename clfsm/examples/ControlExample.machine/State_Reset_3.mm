//
// State_Reset_3.mm -- 2013-04-12 00:14:38 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Reset_3.h"

#include "State_Reset_3_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Reset_3::Reset_3(const char *name): CLState(name, *new Reset_3::OnEntry, *new Reset_3::OnExit, *new Reset_3::Internal)
{
	_transitions[0] = new Transition_0();
}

Reset_3::~Reset_3()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Reset_3::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_3_VarRefs.mm"
#	include "State_Reset_3_OnEntry.mm"
}

void Reset_3::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_3_VarRefs.mm"
#	include "State_Reset_3_OnExit.mm"
}

void Reset_3::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_3_VarRefs.mm"
#	include "State_Reset_3_Internal.mm"
}

bool Reset_3::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_3_VarRefs.mm"

	return
	(
#		include "State_Reset_3_Transition_0.expr"
	);
}
