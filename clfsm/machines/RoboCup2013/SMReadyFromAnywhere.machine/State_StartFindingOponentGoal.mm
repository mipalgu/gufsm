//
// State_StartFindingOponentGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_StartFindingOponentGoal.h"

#include "State_StartFindingOponentGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

StartFindingOponentGoal::StartFindingOponentGoal(const char *name): CLState(name, *new StartFindingOponentGoal::OnEntry, *new StartFindingOponentGoal::OnExit, *new StartFindingOponentGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

StartFindingOponentGoal::~StartFindingOponentGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void StartFindingOponentGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOponentGoal_VarRefs.mm"
#	include "State_StartFindingOponentGoal_OnEntry.mm"
}

void StartFindingOponentGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOponentGoal_VarRefs.mm"
#	include "State_StartFindingOponentGoal_OnExit.mm"
}

void StartFindingOponentGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOponentGoal_VarRefs.mm"
#	include "State_StartFindingOponentGoal_Internal.mm"
}

bool StartFindingOponentGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOponentGoal_VarRefs.mm"

	return
	(
#		include "State_StartFindingOponentGoal_Transition_0.expr"
	);
}

bool StartFindingOponentGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StartFindingOponentGoal_VarRefs.mm"

	return
	(
#		include "State_StartFindingOponentGoal_Transition_1.expr"
	);
}
