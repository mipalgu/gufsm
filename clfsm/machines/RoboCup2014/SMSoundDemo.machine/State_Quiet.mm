//
// State_Quiet.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundDemo_Includes.h"
#include "SMSoundDemo.h"
#include "State_Quiet.h"

#include "State_Quiet_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundDemo;
using namespace State;

Quiet::Quiet(const char *name): CLState(name, *new Quiet::OnEntry, *new Quiet::OnExit, *new Quiet::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Quiet::~Quiet()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Quiet::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_OnEntry.mm"
}

void Quiet::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_OnExit.mm"
}

void Quiet::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_Internal.mm"
}

bool Quiet::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"

	return
	(
#		include "State_Quiet_Transition_0.expr"
	);
}

bool Quiet::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"

	return
	(
#		include "State_Quiet_Transition_1.expr"
	);
}
