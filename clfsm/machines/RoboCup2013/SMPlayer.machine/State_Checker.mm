//
// State_Checker.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_Checker.h"

#include "State_Checker_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

Checker::Checker(const char *name): CLState(name, *new Checker::OnEntry, *new Checker::OnExit, *new Checker::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Checker::~Checker()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Checker::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"
#	include "State_Checker_OnEntry.mm"
}

void Checker::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"
#	include "State_Checker_OnExit.mm"
}

void Checker::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"
#	include "State_Checker_Internal.mm"
}

bool Checker::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"

	return
	(
#		include "State_Checker_Transition_0.expr"
	);
}

bool Checker::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"

	return
	(
#		include "State_Checker_Transition_1.expr"
	);
}

bool Checker::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_Checker_VarRefs.mm"

	return
	(
#		include "State_Checker_Transition_2.expr"
	);
}
