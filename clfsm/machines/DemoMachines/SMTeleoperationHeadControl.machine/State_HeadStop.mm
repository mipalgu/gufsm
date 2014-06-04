//
// State_HeadStop.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"
#include "State_HeadStop.h"

#include "State_HeadStop_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationHeadControl;
using namespace State;

HeadStop::HeadStop(const char *name): CLState(name, *new HeadStop::OnEntry, *new HeadStop::OnExit, *new HeadStop::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

HeadStop::~HeadStop()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void HeadStop::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStop_VarRefs.mm"
#	include "State_HeadStop_OnEntry.mm"
}

void HeadStop::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStop_VarRefs.mm"
#	include "State_HeadStop_OnExit.mm"
}

void HeadStop::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStop_VarRefs.mm"
#	include "State_HeadStop_Internal.mm"
}

bool HeadStop::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStop_VarRefs.mm"

	return
	(
#		include "State_HeadStop_Transition_0.expr"
	);
}

bool HeadStop::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStop_VarRefs.mm"

	return
	(
#		include "State_HeadStop_Transition_1.expr"
	);
}
