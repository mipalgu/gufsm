//
// State_Measure_Displacement.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMOdometryTest_Includes.h"
#include "SMOdometryTest.h"
#include "State_Measure_Displacement.h"

#include "State_Measure_Displacement_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMOdometryTest;
using namespace State;

Measure_Displacement::Measure_Displacement(const char *name): CLState(name, *new Measure_Displacement::OnEntry, *new Measure_Displacement::OnExit, *new Measure_Displacement::Internal)
{
	_transitions[0] = new Transition_0();
}

Measure_Displacement::~Measure_Displacement()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Measure_Displacement::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Measure_Displacement_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Measure_Displacement_FuncRefs.mm"
#	include "State_Measure_Displacement_OnEntry.mm"
}

void Measure_Displacement::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Measure_Displacement_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Measure_Displacement_FuncRefs.mm"
#	include "State_Measure_Displacement_OnExit.mm"
}

void Measure_Displacement::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Measure_Displacement_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Measure_Displacement_FuncRefs.mm"
#	include "State_Measure_Displacement_Internal.mm"
}

bool Measure_Displacement::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMOdometryTest_VarRefs.mm"
#	include "State_Measure_Displacement_VarRefs.mm"
#	include "SMOdometryTest_FuncRefs.mm"
#	include "State_Measure_Displacement_FuncRefs.mm"

	return
	(
#		include "State_Measure_Displacement_Transition_0.expr"
	);
}
