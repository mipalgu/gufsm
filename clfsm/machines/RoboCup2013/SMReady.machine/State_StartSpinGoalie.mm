//
// State_StartSpinGoalie.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_StartSpinGoalie.h"

#include "State_StartSpinGoalie_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

StartSpinGoalie::StartSpinGoalie(const char *name): CLState(name, *new StartSpinGoalie::OnEntry, *new StartSpinGoalie::OnExit, *new StartSpinGoalie::Internal)
{
	_transitions[0] = new Transition_0();
}

StartSpinGoalie::~StartSpinGoalie()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartSpinGoalie::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StartSpinGoalie_VarRefs.mm"
#	include "State_StartSpinGoalie_OnEntry.mm"
}

void StartSpinGoalie::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StartSpinGoalie_VarRefs.mm"
#	include "State_StartSpinGoalie_OnExit.mm"
}

void StartSpinGoalie::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StartSpinGoalie_VarRefs.mm"
#	include "State_StartSpinGoalie_Internal.mm"
}

bool StartSpinGoalie::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_StartSpinGoalie_VarRefs.mm"

	return
	(
#		include "State_StartSpinGoalie_Transition_0.expr"
	);
}
