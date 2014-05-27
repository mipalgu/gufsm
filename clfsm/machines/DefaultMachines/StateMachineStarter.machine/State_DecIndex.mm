//
// State_DecIndex.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_DecIndex.h"

#include "State_DecIndex_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

DecIndex::DecIndex(const char *name): CLState(name, *new DecIndex::OnEntry, *new DecIndex::OnExit, *new DecIndex::Internal)
{
	_transitions[0] = new Transition_0();
}

DecIndex::~DecIndex()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DecIndex::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_DecIndex_VarRefs.mm"
#	include "State_DecIndex_OnEntry.mm"
}

void DecIndex::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_DecIndex_VarRefs.mm"
#	include "State_DecIndex_OnExit.mm"
}

void DecIndex::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_DecIndex_VarRefs.mm"
#	include "State_DecIndex_Internal.mm"
}

bool DecIndex::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_DecIndex_VarRefs.mm"

	return
	(
#		include "State_DecIndex_Transition_0.expr"
	);
}
