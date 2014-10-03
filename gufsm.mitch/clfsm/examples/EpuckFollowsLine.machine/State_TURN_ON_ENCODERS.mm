//
//State_TURN_ON_ENCODERS.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "EpuckFollowsLine_Includes.h"
#include "EpuckFollowsLine.h"

#include "State_TURN_ON_ENCODERS.h"
#include "State_TURN_ON_ENCODERS_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMEpuckFollowsLine;
using namespace State;

TURN_ON_ENCODERS::TURN_ON_ENCODERS(const char *name):CLState(name, *new TURN_ON_ENCODERS::OnEntry,*new TURN_ON_ENCODERS::OnExit, *new TURN_ON_ENCODERS::Internal)
{
	_transitions[0] = new Transition_0();	_transitions[1] = new Transition_1();
}

TURN_ON_ENCODERS::~TURN_ON_ENCODERS()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void TURN_ON_ENCODERS::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_OnEntry.mm"
}

void TURN_ON_ENCODERS::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_OnExit.mm"
}

void TURN_ON_ENCODERS::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_Internal.mm"
}

bool TURN_ON_ENCODERS::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_VarRefs.mm"

	return
	(
#			include "State_TURN_ON_ENCODERS_Transition_0.expr"
	);
}
bool TURN_ON_ENCODERS::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "EpuckFollowsLine_VarRefs.mm"
#	include "State_TURN_ON_ENCODERS_VarRefs.mm"

	return
	(
#			include "State_TURN_ON_ENCODERS_Transition_1.expr"
	);
}


