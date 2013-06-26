//
// State_StopTurning.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_StopTurning.h"

#include "State_StopTurning_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

StopTurning::StopTurning(const char *name): CLState(name, *new StopTurning::OnEntry, *new StopTurning::OnExit, *new StopTurning::Internal)
{
	_transitions[0] = new Transition_0();
}

StopTurning::~StopTurning()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StopTurning::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StopTurning_VarRefs.mm"
#	include "State_StopTurning_OnEntry.mm"
}

void StopTurning::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StopTurning_VarRefs.mm"
#	include "State_StopTurning_OnExit.mm"
}

void StopTurning::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StopTurning_VarRefs.mm"
#	include "State_StopTurning_Internal.mm"
}

bool StopTurning::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StopTurning_VarRefs.mm"

	return
	(
#		include "State_StopTurning_Transition_0.expr"
	);
}
