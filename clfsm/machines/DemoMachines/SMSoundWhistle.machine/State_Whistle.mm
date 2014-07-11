//
// State_Whistle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundWhistle_Includes.h"
#include "SMSoundWhistle.h"
#include "State_Whistle.h"

#include "State_Whistle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundWhistle;
using namespace State;

Whistle::Whistle(const char *name): CLState(name, *new Whistle::OnEntry, *new Whistle::OnExit, *new Whistle::Internal)
{
	_transitions[0] = new Transition_0();
}

Whistle::~Whistle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Whistle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Whistle_VarRefs.mm"
#	include "State_Whistle_OnEntry.mm"
}

void Whistle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Whistle_VarRefs.mm"
#	include "State_Whistle_OnExit.mm"
}

void Whistle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Whistle_VarRefs.mm"
#	include "State_Whistle_Internal.mm"
}

bool Whistle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Whistle_VarRefs.mm"

	return
	(
#		include "State_Whistle_Transition_0.expr"
	);
}
