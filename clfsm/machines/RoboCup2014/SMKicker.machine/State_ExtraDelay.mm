//
// State_ExtraDelay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_ExtraDelay.h"

#include "State_ExtraDelay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

ExtraDelay::ExtraDelay(const char *name): CLState(name, *new ExtraDelay::OnEntry, *new ExtraDelay::OnExit, *new ExtraDelay::Internal)
{
	_transitions[0] = new Transition_0();
}

ExtraDelay::~ExtraDelay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ExtraDelay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_ExtraDelay_VarRefs.mm"
#	include "State_ExtraDelay_OnEntry.mm"
}

void ExtraDelay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_ExtraDelay_VarRefs.mm"
#	include "State_ExtraDelay_OnExit.mm"
}

void ExtraDelay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_ExtraDelay_VarRefs.mm"
#	include "State_ExtraDelay_Internal.mm"
}

bool ExtraDelay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_ExtraDelay_VarRefs.mm"

	return
	(
#		include "State_ExtraDelay_Transition_0.expr"
	);
}
