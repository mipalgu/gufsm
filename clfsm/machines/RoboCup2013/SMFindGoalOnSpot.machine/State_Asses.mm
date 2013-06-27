//
// State_Asses.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFindGoalOnSpot_Includes.h"
#include "SMFindGoalOnSpot.h"
#include "State_Asses.h"

#include "State_Asses_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFindGoalOnSpot;
using namespace State;

Asses::Asses(const char *name): CLState(name, *new Asses::OnEntry, *new Asses::OnExit, *new Asses::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
	_transitions[4] = new Transition_4();
}

Asses::~Asses()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
	delete _transitions[4];
}

void Asses::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_OnEntry.mm"
}

void Asses::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_OnExit.mm"
}

void Asses::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"
#	include "State_Asses_Internal.mm"
}

bool Asses::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_0.expr"
	);
}

bool Asses::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_1.expr"
	);
}

bool Asses::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_2.expr"
	);
}

bool Asses::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_3.expr"
	);
}

bool Asses::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_Asses_VarRefs.mm"

	return
	(
#		include "State_Asses_Transition_4.expr"
	);
}
