//
// State_IncIndex.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_IncIndex.h"

#include "State_IncIndex_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

IncIndex::IncIndex(const char *name): CLState(name, *new IncIndex::OnEntry, *new IncIndex::OnExit, *new IncIndex::Internal)
{
	_transitions[0] = new Transition_0();
}

IncIndex::~IncIndex()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void IncIndex::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_IncIndex_VarRefs.mm"
#	include "State_IncIndex_OnEntry.mm"
}

void IncIndex::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_IncIndex_VarRefs.mm"
#	include "State_IncIndex_OnExit.mm"
}

void IncIndex::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_IncIndex_VarRefs.mm"
#	include "State_IncIndex_Internal.mm"
}

bool IncIndex::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_IncIndex_VarRefs.mm"

	return
	(
#		include "State_IncIndex_Transition_0.expr"
	);
}
