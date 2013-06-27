//
// State_Kneel.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_Kneel.h"

#include "State_Kneel_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

Kneel::Kneel(const char *name): CLState(name, *new Kneel::OnEntry, *new Kneel::OnExit, *new Kneel::Internal)
{
	_transitions[0] = new Transition_0();
}

Kneel::~Kneel()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Kneel::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Kneel_VarRefs.mm"
#	include "State_Kneel_OnEntry.mm"
}

void Kneel::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Kneel_VarRefs.mm"
#	include "State_Kneel_OnExit.mm"
}

void Kneel::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Kneel_VarRefs.mm"
#	include "State_Kneel_Internal.mm"
}

bool Kneel::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Kneel_VarRefs.mm"

	return
	(
#		include "State_Kneel_Transition_0.expr"
	);
}
