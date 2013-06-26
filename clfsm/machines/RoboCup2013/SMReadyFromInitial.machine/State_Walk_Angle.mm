//
// State_Walk_Angle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_Walk_Angle.h"

#include "State_Walk_Angle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

Walk_Angle::Walk_Angle(const char *name): CLState(name, *new Walk_Angle::OnEntry, *new Walk_Angle::OnExit, *new Walk_Angle::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Walk_Angle::~Walk_Angle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Walk_Angle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"
#	include "State_Walk_Angle_OnEntry.mm"
}

void Walk_Angle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"
#	include "State_Walk_Angle_OnExit.mm"
}

void Walk_Angle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"
#	include "State_Walk_Angle_Internal.mm"
}

bool Walk_Angle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"

	return
	(
#		include "State_Walk_Angle_Transition_0.expr"
	);
}

bool Walk_Angle::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"

	return
	(
#		include "State_Walk_Angle_Transition_1.expr"
	);
}

bool Walk_Angle::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Walk_Angle_VarRefs.mm"

	return
	(
#		include "State_Walk_Angle_Transition_2.expr"
	);
}
