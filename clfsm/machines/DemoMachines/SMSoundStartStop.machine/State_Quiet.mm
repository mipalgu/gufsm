//
// State_Quiet.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundStartStop_Includes.h"
#include "SMSoundStartStop.h"
#include "State_Quiet.h"

#include "State_Quiet_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundStartStop;
using namespace State;

Quiet::Quiet(const char *name): CLState(name, *new Quiet::OnEntry, *new Quiet::OnExit, *new Quiet::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Quiet::~Quiet()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Quiet::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_OnEntry.mm"
}

void Quiet::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_OnExit.mm"
}

void Quiet::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"
#	include "State_Quiet_Internal.mm"
}

bool Quiet::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"

	return
	(
#		include "State_Quiet_Transition_0.expr"
	);
}

bool Quiet::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"

	return
	(
#		include "State_Quiet_Transition_1.expr"
	);
}

bool Quiet::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundStartStop_VarRefs.mm"
#	include "State_Quiet_VarRefs.mm"

	return
	(
#		include "State_Quiet_Transition_2.expr"
	);
}
