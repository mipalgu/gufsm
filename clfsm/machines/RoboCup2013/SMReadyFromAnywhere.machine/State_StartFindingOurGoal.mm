//
// State_StartFindingOurGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_StartFindingOurGoal.h"

#include "State_StartFindingOurGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

StartFindingOurGoal::StartFindingOurGoal(const char *name): CLState(name, *new StartFindingOurGoal::OnEntry, *new StartFindingOurGoal::OnExit, *new StartFindingOurGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

StartFindingOurGoal::~StartFindingOurGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartFindingOurGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOurGoal_VarRefs.mm"
#	include "State_StartFindingOurGoal_OnEntry.mm"
}

void StartFindingOurGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOurGoal_VarRefs.mm"
#	include "State_StartFindingOurGoal_OnExit.mm"
}

void StartFindingOurGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOurGoal_VarRefs.mm"
#	include "State_StartFindingOurGoal_Internal.mm"
}

bool StartFindingOurGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOurGoal_VarRefs.mm"

	return
	(
#		include "State_StartFindingOurGoal_Transition_0.expr"
	);
}
