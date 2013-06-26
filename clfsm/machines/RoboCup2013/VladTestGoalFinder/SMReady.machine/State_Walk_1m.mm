//
// State_Walk_1m.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_Walk_1m.h"

#include "State_Walk_1m_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

Walk_1m::Walk_1m(const char *name): CLState(name, *new Walk_1m::OnEntry, *new Walk_1m::OnExit, *new Walk_1m::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Walk_1m::~Walk_1m()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Walk_1m::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_1m_VarRefs.mm"
#	include "State_Walk_1m_OnEntry.mm"
}

void Walk_1m::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_1m_VarRefs.mm"
#	include "State_Walk_1m_OnExit.mm"
}

void Walk_1m::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_1m_VarRefs.mm"
#	include "State_Walk_1m_Internal.mm"
}

bool Walk_1m::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_1m_VarRefs.mm"

	return
	(
#		include "State_Walk_1m_Transition_0.expr"
	);
}

bool Walk_1m::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Walk_1m_VarRefs.mm"

	return
	(
#		include "State_Walk_1m_Transition_1.expr"
	);
}
