//
// State_Walk_2m.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_Walk_2m.h"

#include "State_Walk_2m_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

Walk_2m::Walk_2m(const char *name): CLState(name, *new Walk_2m::OnEntry, *new Walk_2m::OnExit, *new Walk_2m::Internal)
{
	_transitions[0] = new Transition_0();
}

Walk_2m::~Walk_2m()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Walk_2m::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_2m_VarRefs.mm"
#	include "State_Walk_2m_OnEntry.mm"
}

void Walk_2m::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_2m_VarRefs.mm"
#	include "State_Walk_2m_OnExit.mm"
}

void Walk_2m::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_2m_VarRefs.mm"
#	include "State_Walk_2m_Internal.mm"
}

bool Walk_2m::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_2m_VarRefs.mm"

	return
	(
#		include "State_Walk_2m_Transition_0.expr"
	);
}
