//
// State_Reset_4.mm -- 2013-04-12 00:23:01 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Reset_4.h"

#include "State_Reset_4_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Reset_4::Reset_4(const char *name): CLState(name, *new Reset_4::OnEntry, *new Reset_4::OnExit, *new Reset_4::Internal)
{
	_transitions[0] = new Transition_0();
}

Reset_4::~Reset_4()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Reset_4::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_4_VarRefs.mm"
#	include "State_Reset_4_OnEntry.mm"
}

void Reset_4::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_4_VarRefs.mm"
#	include "State_Reset_4_OnExit.mm"
}

void Reset_4::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_4_VarRefs.mm"
#	include "State_Reset_4_Internal.mm"
}

bool Reset_4::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_4_VarRefs.mm"

	return
	(
#		include "State_Reset_4_Transition_0.expr"
	);
}
