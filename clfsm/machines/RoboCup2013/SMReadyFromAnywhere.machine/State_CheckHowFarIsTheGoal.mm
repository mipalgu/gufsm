//
// State_CheckHowFarIsTheGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_CheckHowFarIsTheGoal.h"

#include "State_CheckHowFarIsTheGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

CheckHowFarIsTheGoal::CheckHowFarIsTheGoal(const char *name): CLState(name, *new CheckHowFarIsTheGoal::OnEntry, *new CheckHowFarIsTheGoal::OnExit, *new CheckHowFarIsTheGoal::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckHowFarIsTheGoal::~CheckHowFarIsTheGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void CheckHowFarIsTheGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_OnEntry.mm"
}

void CheckHowFarIsTheGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_OnExit.mm"
}

void CheckHowFarIsTheGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_Internal.mm"
}

bool CheckHowFarIsTheGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_VarRefs.mm"

	return
	(
#		include "State_CheckHowFarIsTheGoal_Transition_0.expr"
	);
}

bool CheckHowFarIsTheGoal::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_CheckHowFarIsTheGoal_VarRefs.mm"

	return
	(
#		include "State_CheckHowFarIsTheGoal_Transition_1.expr"
	);
}
