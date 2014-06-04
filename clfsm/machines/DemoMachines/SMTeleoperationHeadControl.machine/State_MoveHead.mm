//
// State_MoveHead.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationHeadControl_Includes.h"
#include "SMTeleoperationHeadControl.h"
#include "State_MoveHead.h"

#include "State_MoveHead_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationHeadControl;
using namespace State;

MoveHead::MoveHead(const char *name): CLState(name, *new MoveHead::OnEntry, *new MoveHead::OnExit, *new MoveHead::Internal)
{
	_transitions[0] = new Transition_0();
}

MoveHead::~MoveHead()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void MoveHead::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_MoveHead_VarRefs.mm"
#	include "State_MoveHead_OnEntry.mm"
}

void MoveHead::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_MoveHead_VarRefs.mm"
#	include "State_MoveHead_OnExit.mm"
}

void MoveHead::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_MoveHead_VarRefs.mm"
#	include "State_MoveHead_Internal.mm"
}

bool MoveHead::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationHeadControl_VarRefs.mm"
#	include "State_MoveHead_VarRefs.mm"

	return
	(
#		include "State_MoveHead_Transition_0.expr"
	);
}
