//
// State_CheckWhisle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundWhistle_Includes.h"
#include "SMSoundWhistle.h"
#include "State_CheckWhisle.h"

#include "State_CheckWhisle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundWhistle;
using namespace State;

CheckWhisle::CheckWhisle(const char *name): CLState(name, *new CheckWhisle::OnEntry, *new CheckWhisle::OnExit, *new CheckWhisle::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckWhisle::~CheckWhisle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckWhisle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_CheckWhisle_VarRefs.mm"
#	include "State_CheckWhisle_OnEntry.mm"
}

void CheckWhisle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_CheckWhisle_VarRefs.mm"
#	include "State_CheckWhisle_OnExit.mm"
}

void CheckWhisle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_CheckWhisle_VarRefs.mm"
#	include "State_CheckWhisle_Internal.mm"
}

bool CheckWhisle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_CheckWhisle_VarRefs.mm"

	return
	(
#		include "State_CheckWhisle_Transition_0.expr"
	);
}

bool CheckWhisle::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_CheckWhisle_VarRefs.mm"

	return
	(
#		include "State_CheckWhisle_Transition_1.expr"
	);
}
