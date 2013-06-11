//
// State_FInishKick.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker3_Includes.h"
#include "SMKicker3.h"
#include "State_FInishKick.h"

#include "State_FInishKick_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker3;
using namespace State;

FInishKick::FInishKick(const char *name): CLState(name, *new FInishKick::OnEntry, *new FInishKick::OnExit, *new FInishKick::Internal)
{
	_transitions[0] = new Transition_0();
}

FInishKick::~FInishKick()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FInishKick::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_FInishKick_VarRefs.mm"
#	include "State_FInishKick_OnEntry.mm"
}

void FInishKick::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_FInishKick_VarRefs.mm"
#	include "State_FInishKick_OnExit.mm"
}

void FInishKick::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_FInishKick_VarRefs.mm"
#	include "State_FInishKick_Internal.mm"
}

bool FInishKick::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker3_VarRefs.mm"
#	include "State_FInishKick_VarRefs.mm"

	return
	(
#		include "State_FInishKick_Transition_0.expr"
	);
}
