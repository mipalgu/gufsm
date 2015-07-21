//
//State_FEEDBACK_CONTROL.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_FEEDBACK_CONTROL.h"
#include "State_FEEDBACK_CONTROL_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEpuckFollowsLine;
using namespace State;

FEEDBACK_CONTROL::FEEDBACK_CONTROL(const char *name):CLState(name, *new FEEDBACK_CONTROL::OnEntry,*new FEEDBACK_CONTROL::OnExit, *new FEEDBACK_CONTROL::Internal)
{
	_transitions[0] = new Transition_0();
}

FEEDBACK_CONTROL::~FEEDBACK_CONTROL()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void FEEDBACK_CONTROL::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_OnEntry.mm"
}

void FEEDBACK_CONTROL::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_OnExit.mm"
}

void FEEDBACK_CONTROL::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_Internal.mm"
}

bool FEEDBACK_CONTROL::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_FEEDBACK_CONTROL_VarRefs.mm"

	return
	(
#			include "State_FEEDBACK_CONTROL_Transition_0.expr"
	);
}


