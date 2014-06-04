//
// State_HelpMessage_2.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_HelpMessage_2.h"

#include "State_HelpMessage_2_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

HelpMessage_2::HelpMessage_2(const char *name): CLState(name, *new HelpMessage_2::OnEntry, *new HelpMessage_2::OnExit, *new HelpMessage_2::Internal)
{
	_transitions[0] = new Transition_0();
}

HelpMessage_2::~HelpMessage_2()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HelpMessage_2::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_2_VarRefs.mm"
#	include "State_HelpMessage_2_OnEntry.mm"
}

void HelpMessage_2::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_2_VarRefs.mm"
#	include "State_HelpMessage_2_OnExit.mm"
}

void HelpMessage_2::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_2_VarRefs.mm"
#	include "State_HelpMessage_2_Internal.mm"
}

bool HelpMessage_2::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_2_VarRefs.mm"

	return
	(
#		include "State_HelpMessage_2_Transition_0.expr"
	);
}
