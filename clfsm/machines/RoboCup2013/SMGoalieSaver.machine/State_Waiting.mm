//
// State_Waiting.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_Waiting.h"

#include "State_Waiting_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

Waiting::Waiting(const char *name): CLState(name, *new Waiting::OnEntry, *new Waiting::OnExit, *new Waiting::Internal)
{
	_transitions[0] = new Transition_0();
}

Waiting::~Waiting()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Waiting::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Waiting_VarRefs.mm"
#	include "State_Waiting_OnEntry.mm"
}

void Waiting::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Waiting_VarRefs.mm"
#	include "State_Waiting_OnExit.mm"
}

void Waiting::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Waiting_VarRefs.mm"
#	include "State_Waiting_Internal.mm"
}

bool Waiting::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Waiting_VarRefs.mm"

	return
	(
#		include "State_Waiting_Transition_0.expr"
	);
}
