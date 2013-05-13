//
// State_Play.mm -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_Includes.h"
#include "GameController.h"
#include "State_Play.h"

#include "State_Play_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController;
using namespace State;

Play::Play(const char *name): CLState(name, *new Play::OnEntry, *new Play::OnExit, *new Play::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
}

Play::~Play()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
}

void Play::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"
#	include "State_Play_OnEntry.mm"
}

void Play::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"
#	include "State_Play_OnExit.mm"
}

void Play::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"
#	include "State_Play_Internal.mm"
}

bool Play::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"

	return
	(
#		include "State_Play_Transition_0.expr"
	);
}

bool Play::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"

	return
	(
#		include "State_Play_Transition_1.expr"
	);
}

bool Play::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"

	return
	(
#		include "State_Play_Transition_2.expr"
	);
}

bool Play::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Play_VarRefs.mm"

	return
	(
#		include "State_Play_Transition_3.expr"
	);
}
