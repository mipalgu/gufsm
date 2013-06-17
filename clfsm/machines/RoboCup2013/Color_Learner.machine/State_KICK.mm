//
// State_KICK.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_KICK.h"

#include "State_KICK_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

KICK::KICK(const char *name): CLState(name, *new KICK::OnEntry, *new KICK::OnExit, *new KICK::Internal)
{
	_transitions[0] = new Transition_0();
}

KICK::~KICK()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void KICK::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_KICK_VarRefs.mm"
#	include "State_KICK_OnEntry.mm"
}

void KICK::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_KICK_VarRefs.mm"
#	include "State_KICK_OnExit.mm"
}

void KICK::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_KICK_VarRefs.mm"
#	include "State_KICK_Internal.mm"
}

bool KICK::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_KICK_VarRefs.mm"

	return
	(
#		include "State_KICK_Transition_0.expr"
	);
}
