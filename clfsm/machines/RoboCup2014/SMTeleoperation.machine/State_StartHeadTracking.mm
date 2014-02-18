//
// State_StartHeadTracking.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_StartHeadTracking.h"

#include "State_StartHeadTracking_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

StartHeadTracking::StartHeadTracking(const char *name): CLState(name, *new StartHeadTracking::OnEntry, *new StartHeadTracking::OnExit, *new StartHeadTracking::Internal)
{
	_transitions[0] = new Transition_0();
}

StartHeadTracking::~StartHeadTracking()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartHeadTracking::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_StartHeadTracking_VarRefs.mm"
#	include "State_StartHeadTracking_OnEntry.mm"
}

void StartHeadTracking::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_StartHeadTracking_VarRefs.mm"
#	include "State_StartHeadTracking_OnExit.mm"
}

void StartHeadTracking::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_StartHeadTracking_VarRefs.mm"
#	include "State_StartHeadTracking_Internal.mm"
}

bool StartHeadTracking::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_StartHeadTracking_VarRefs.mm"

	return
	(
#		include "State_StartHeadTracking_Transition_0.expr"
	);
}
