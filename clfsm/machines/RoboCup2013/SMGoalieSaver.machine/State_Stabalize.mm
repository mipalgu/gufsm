//
// State_Stabalize.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_Stabalize.h"

#include "State_Stabalize_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

Stabalize::Stabalize(const char *name): CLState(name, *new Stabalize::OnEntry, *new Stabalize::OnExit, *new Stabalize::Internal)
{
	_transitions[0] = new Transition_0();
}

Stabalize::~Stabalize()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Stabalize::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Stabalize_VarRefs.mm"
#	include "State_Stabalize_OnEntry.mm"
}

void Stabalize::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Stabalize_VarRefs.mm"
#	include "State_Stabalize_OnExit.mm"
}

void Stabalize::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Stabalize_VarRefs.mm"
#	include "State_Stabalize_Internal.mm"
}

bool Stabalize::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Stabalize_VarRefs.mm"

	return
	(
#		include "State_Stabalize_Transition_0.expr"
	);
}
