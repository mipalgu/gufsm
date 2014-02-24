//
//State_MOTOR_NXT_OFF.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "MotorNXT_Includes.h"
#include "MotorNXT.h"

#include "State_MOTOR_NXT_OFF.h"
#include "State_MOTOR_NXT_OFF_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMMotorNXT;
using namespace State;

MOTOR_NXT_OFF::MOTOR_NXT_OFF(const char *name):CLState(name, *new MOTOR_NXT_OFF::OnEntry,*new MOTOR_NXT_OFF::OnExit, *new MOTOR_NXT_OFF::Internal)
{
	_transitions[0] = new Transition_0();
}

MOTOR_NXT_OFF::~MOTOR_NXT_OFF()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void MOTOR_NXT_OFF::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_OnEntry.mm"
}

void MOTOR_NXT_OFF::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_OnExit.mm"
}

void MOTOR_NXT_OFF::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_Internal.mm"
}

bool MOTOR_NXT_OFF::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "MotorNXT_VarRefs.mm"
#	include "State_MOTOR_NXT_OFF_VarRefs.mm"

	return
	(
#			include "State_MOTOR_NXT_OFF_Transition_0.expr"
	);
}


