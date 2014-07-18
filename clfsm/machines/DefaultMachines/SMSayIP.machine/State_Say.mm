//
// State_Say.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSayIP_Includes.h"
#include "SMSayIP.h"
#include "State_Say.h"

#include "State_Say_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSayIP;
using namespace State;

Say::Say(const char *name): CLState(name, *new Say::OnEntry, *new Say::OnExit, *new Say::Internal)
{
	_transitions[0] = new Transition_0();
}

Say::~Say()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Say::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSayIP_VarRefs.mm"
#	include "State_Say_VarRefs.mm"
#	include "State_Say_OnEntry.mm"
}

void Say::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSayIP_VarRefs.mm"
#	include "State_Say_VarRefs.mm"
#	include "State_Say_OnExit.mm"
}

void Say::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSayIP_VarRefs.mm"
#	include "State_Say_VarRefs.mm"
#	include "State_Say_Internal.mm"
}

bool Say::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSayIP_VarRefs.mm"
#	include "State_Say_VarRefs.mm"

	return
	(
#		include "State_Say_Transition_0.expr"
	);
}
