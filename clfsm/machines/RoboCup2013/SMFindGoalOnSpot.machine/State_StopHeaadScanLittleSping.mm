//
// State_StopHeaadScanLittleSping.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMFindGoalOnSpot_Includes.h"
#include "SMFindGoalOnSpot.h"
#include "State_StopHeaadScanLittleSping.h"

#include "State_StopHeaadScanLittleSping_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMFindGoalOnSpot;
using namespace State;

StopHeaadScanLittleSping::StopHeaadScanLittleSping(const char *name): CLState(name, *new StopHeaadScanLittleSping::OnEntry, *new StopHeaadScanLittleSping::OnExit, *new StopHeaadScanLittleSping::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

StopHeaadScanLittleSping::~StopHeaadScanLittleSping()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void StopHeaadScanLittleSping::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_OnEntry.mm"
}

void StopHeaadScanLittleSping::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_OnExit.mm"
}

void StopHeaadScanLittleSping::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_Internal.mm"
}

bool StopHeaadScanLittleSping::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_VarRefs.mm"

	return
	(
#		include "State_StopHeaadScanLittleSping_Transition_0.expr"
	);
}

bool StopHeaadScanLittleSping::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMFindGoalOnSpot_VarRefs.mm"
#	include "State_StopHeaadScanLittleSping_VarRefs.mm"

	return
	(
#		include "State_StopHeaadScanLittleSping_Transition_1.expr"
	);
}
