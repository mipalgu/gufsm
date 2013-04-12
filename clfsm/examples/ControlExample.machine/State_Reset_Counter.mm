//
// State_Reset_Counter.mm -- 2013-04-12 00:14:38 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Reset_Counter.h"

#include "State_Reset_Counter_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Reset_Counter::Reset_Counter(const char *name): CLState(name, *new Reset_Counter::OnEntry, *new Reset_Counter::OnExit, *new Reset_Counter::Internal)
{
	_transitions[0] = new Transition_0();
}

Reset_Counter::~Reset_Counter()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Reset_Counter::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Counter_VarRefs.mm"
#	include "State_Reset_Counter_OnEntry.mm"
}

void Reset_Counter::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Counter_VarRefs.mm"
#	include "State_Reset_Counter_OnExit.mm"
}

void Reset_Counter::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Counter_VarRefs.mm"
#	include "State_Reset_Counter_Internal.mm"
}

bool Reset_Counter::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Reset_Counter_VarRefs.mm"

	return
	(
#		include "State_Reset_Counter_Transition_0.expr"
	);
}
