//
// State_PREPARE_TO_KICK.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_PREPARE_TO_KICK.h"

#include "State_PREPARE_TO_KICK_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

PREPARE_TO_KICK::PREPARE_TO_KICK(const char *name): CLState(name, *new PREPARE_TO_KICK::OnEntry, *new PREPARE_TO_KICK::OnExit, *new PREPARE_TO_KICK::Internal)
{
	_transitions[0] = new Transition_0();
}

PREPARE_TO_KICK::~PREPARE_TO_KICK()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void PREPARE_TO_KICK::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_OnEntry.mm"
}

void PREPARE_TO_KICK::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_OnExit.mm"
}

void PREPARE_TO_KICK::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_Internal.mm"
}

bool PREPARE_TO_KICK::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_PREPARE_TO_KICK_VarRefs.mm"

	return
	(
#		include "State_PREPARE_TO_KICK_Transition_0.expr"
	);
}
