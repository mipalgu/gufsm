//
// State_Retry.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundDemo_Includes.h"
#include "SMSoundDemo.h"
#include "State_Retry.h"

#include "State_Retry_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundDemo;
using namespace State;

Retry::Retry(const char *name): CLState(name, *new Retry::OnEntry, *new Retry::OnExit, *new Retry::Internal)
{
	_transitions[0] = new Transition_0();
}

Retry::~Retry()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Retry::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Retry_VarRefs.mm"
#	include "State_Retry_OnEntry.mm"
}

void Retry::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Retry_VarRefs.mm"
#	include "State_Retry_OnExit.mm"
}

void Retry::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Retry_VarRefs.mm"
#	include "State_Retry_Internal.mm"
}

bool Retry::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Retry_VarRefs.mm"

	return
	(
#		include "State_Retry_Transition_0.expr"
	);
}
