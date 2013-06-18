//
// State_Colors_Learned.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Colors_Learned.h"

#include "State_Colors_Learned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Colors_Learned::Colors_Learned(const char *name): CLState(name, *new Colors_Learned::OnEntry, *new Colors_Learned::OnExit, *new Colors_Learned::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Colors_Learned::~Colors_Learned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Colors_Learned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Colors_Learned_VarRefs.mm"
#	include "State_Colors_Learned_OnEntry.mm"
}

void Colors_Learned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Colors_Learned_VarRefs.mm"
#	include "State_Colors_Learned_OnExit.mm"
}

void Colors_Learned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Colors_Learned_VarRefs.mm"
#	include "State_Colors_Learned_Internal.mm"
}

bool Colors_Learned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Colors_Learned_VarRefs.mm"

	return
	(
#		include "State_Colors_Learned_Transition_0.expr"
	);
}

bool Colors_Learned::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Colors_Learned_VarRefs.mm"

	return
	(
#		include "State_Colors_Learned_Transition_1.expr"
	);
}
