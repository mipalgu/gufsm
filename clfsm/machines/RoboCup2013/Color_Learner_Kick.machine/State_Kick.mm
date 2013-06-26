//
// State_Kick.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Kick_Includes.h"
#include "Color_Learner_Kick.h"
#include "State_Kick.h"

#include "State_Kick_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner_Kick;
using namespace State;

Kick::Kick(const char *name): CLState(name, *new Kick::OnEntry, *new Kick::OnExit, *new Kick::Internal)
{
	_transitions[0] = new Transition_0();
}

Kick::~Kick()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Kick::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_OnEntry.mm"
}

void Kick::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_OnExit.mm"
}

void Kick::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"
#	include "State_Kick_Internal.mm"
}

bool Kick::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_Kick_VarRefs.mm"
#	include "State_Kick_VarRefs.mm"

	return
	(
#		include "State_Kick_Transition_0.expr"
	);
}