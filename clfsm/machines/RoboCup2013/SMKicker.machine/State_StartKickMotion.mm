//
// State_StartKickMotion.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_StartKickMotion.h"

#include "State_StartKickMotion_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

StartKickMotion::StartKickMotion(const char *name): CLState(name, *new StartKickMotion::OnEntry, *new StartKickMotion::OnExit, *new StartKickMotion::Internal)
{
	_transitions[0] = new Transition_0();
}

StartKickMotion::~StartKickMotion()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartKickMotion::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_StartKickMotion_VarRefs.mm"
#	include "State_StartKickMotion_OnEntry.mm"
}

void StartKickMotion::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_StartKickMotion_VarRefs.mm"
#	include "State_StartKickMotion_OnExit.mm"
}

void StartKickMotion::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_StartKickMotion_VarRefs.mm"
#	include "State_StartKickMotion_Internal.mm"
}

bool StartKickMotion::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_StartKickMotion_VarRefs.mm"

	return
	(
#		include "State_StartKickMotion_Transition_0.expr"
	);
}
