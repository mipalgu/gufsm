//
// State_Ready.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_Ready.h"

#include "State_Ready_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

Ready::Ready(const char *name): CLState(name, *new Ready::OnEntry, *new Ready::OnExit, *new Ready::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
}

Ready::~Ready()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
}

void Ready::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_OnEntry.mm"
}

void Ready::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_OnExit.mm"
}

void Ready::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"
#	include "State_Ready_Internal.mm"
}

bool Ready::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_0.expr"
	);
}

bool Ready::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_1.expr"
	);
}

bool Ready::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_2.expr"
	);
}

bool Ready::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_Ready_VarRefs.mm"

	return
	(
#		include "State_Ready_Transition_3.expr"
	);
}
