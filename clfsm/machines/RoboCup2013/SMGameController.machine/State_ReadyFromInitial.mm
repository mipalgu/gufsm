//
// State_ReadyFromInitial.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGameController_Includes.h"
#include "SMGameController.h"
#include "State_ReadyFromInitial.h"

#include "State_ReadyFromInitial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGameController;
using namespace State;

ReadyFromInitial::ReadyFromInitial(const char *name): CLState(name, *new ReadyFromInitial::OnEntry, *new ReadyFromInitial::OnExit, *new ReadyFromInitial::Internal)
{
	_transitions[0] = new Transition_0();
}

ReadyFromInitial::~ReadyFromInitial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ReadyFromInitial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ReadyFromInitial_VarRefs.mm"
#	include "State_ReadyFromInitial_OnEntry.mm"
}

void ReadyFromInitial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ReadyFromInitial_VarRefs.mm"
#	include "State_ReadyFromInitial_OnExit.mm"
}

void ReadyFromInitial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ReadyFromInitial_VarRefs.mm"
#	include "State_ReadyFromInitial_Internal.mm"
}

bool ReadyFromInitial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGameController_VarRefs.mm"
#	include "State_ReadyFromInitial_VarRefs.mm"

	return
	(
#		include "State_ReadyFromInitial_Transition_0.expr"
	);
}
