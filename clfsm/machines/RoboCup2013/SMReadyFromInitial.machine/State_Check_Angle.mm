//
// State_Check_Angle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_Check_Angle.h"

#include "State_Check_Angle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

Check_Angle::Check_Angle(const char *name): CLState(name, *new Check_Angle::OnEntry, *new Check_Angle::OnExit, *new Check_Angle::Internal)
{
	_transitions[0] = new Transition_0();
}

Check_Angle::~Check_Angle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Check_Angle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Check_Angle_VarRefs.mm"
#	include "State_Check_Angle_OnEntry.mm"
}

void Check_Angle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Check_Angle_VarRefs.mm"
#	include "State_Check_Angle_OnExit.mm"
}

void Check_Angle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Check_Angle_VarRefs.mm"
#	include "State_Check_Angle_Internal.mm"
}

bool Check_Angle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_Check_Angle_VarRefs.mm"

	return
	(
#		include "State_Check_Angle_Transition_0.expr"
	);
}
