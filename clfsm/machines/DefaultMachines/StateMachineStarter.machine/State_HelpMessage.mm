//
// State_HelpMessage.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_HelpMessage.h"

#include "State_HelpMessage_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

HelpMessage::HelpMessage(const char *name): CLState(name, *new HelpMessage::OnEntry, *new HelpMessage::OnExit, *new HelpMessage::Internal)
{
	_transitions[0] = new Transition_0();
}

HelpMessage::~HelpMessage()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HelpMessage::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_VarRefs.mm"
#	include "State_HelpMessage_OnEntry.mm"
}

void HelpMessage::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_VarRefs.mm"
#	include "State_HelpMessage_OnExit.mm"
}

void HelpMessage::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_VarRefs.mm"
#	include "State_HelpMessage_Internal.mm"
}

bool HelpMessage::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_HelpMessage_VarRefs.mm"

	return
	(
#		include "State_HelpMessage_Transition_0.expr"
	);
}
