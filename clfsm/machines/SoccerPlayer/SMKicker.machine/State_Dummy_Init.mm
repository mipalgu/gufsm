//
// State_Dummy_Init.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_Dummy_Init.h"

#include "State_Dummy_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

Dummy_Init::Dummy_Init(const char *name): CLState(name, *new Dummy_Init::OnEntry, *new Dummy_Init::OnExit, *new Dummy_Init::Internal)
{
	_transitions[0] = new Transition_0();
}

Dummy_Init::~Dummy_Init()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Dummy_Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Dummy_Init_VarRefs.mm"
#	include "State_Dummy_Init_OnEntry.mm"
}

void Dummy_Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Dummy_Init_VarRefs.mm"
#	include "State_Dummy_Init_OnExit.mm"
}

void Dummy_Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Dummy_Init_VarRefs.mm"
#	include "State_Dummy_Init_Internal.mm"
}

bool Dummy_Init::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_Dummy_Init_VarRefs.mm"

	return
	(
#		include "State_Dummy_Init_Transition_0.expr"
	);
}
