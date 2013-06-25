//
// State_Asses.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReady_Includes.h"
#include "SMReady.h"
#include "State_Asses.h"

#include "State_Asses_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReady;
using namespace State;

Asses::Asses(const char *name): CLState(name, *new Asses::OnEntry, *new Asses::OnExit, *new Asses::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Asses::~Asses()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Asses::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_OnEntry.mm"
}

void Asses::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_OnExit.mm"
}

void Asses::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_Internal.mm"
}

bool Asses::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_0.expr"
	);
}

bool Asses::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_1.expr"
	);
}

bool Asses::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReady_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_2.expr"
	);
}
