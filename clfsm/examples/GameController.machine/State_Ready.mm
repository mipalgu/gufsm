//
// State_Ready.mm -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "GameController_Includes.h"
#include "GameController.h"
#include "State_Ready.h"

#include "State_Ready_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMGameController;
using namespace State;

Ready::Ready(const char *name): CLState(name, *new Ready::OnEntry, *new Ready::OnExit, *new Ready::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Ready::~Ready()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Ready::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_OnEntry.mm"
}

void Ready::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_OnExit.mm"
}

void Ready::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_Internal.mm"
}

bool Ready::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_0.expr"
	);
}

bool Ready::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "GameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_1.expr"
	);
}
