//
// State_HeadStandBy.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"
#include "State_HeadStandBy.h"

#include "State_HeadStandBy_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationHeadControl;
using namespace State;

HeadStandBy::HeadStandBy(const char *name): CLState(name, *new HeadStandBy::OnEntry, *new HeadStandBy::OnExit, *new HeadStandBy::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

HeadStandBy::~HeadStandBy()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void HeadStandBy::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStandBy_VarRefs.mm"
#	include "State_HeadStandBy_OnEntry.mm"
}

void HeadStandBy::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStandBy_VarRefs.mm"
#	include "State_HeadStandBy_OnExit.mm"
}

void HeadStandBy::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStandBy_VarRefs.mm"
#	include "State_HeadStandBy_Internal.mm"
}

bool HeadStandBy::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStandBy_VarRefs.mm"

	return
	(
#		include "State_HeadStandBy_Transition_0.expr"
	);
}

bool HeadStandBy::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_HeadStandBy_VarRefs.mm"

	return
	(
#		include "State_HeadStandBy_Transition_1.expr"
	);
}
