//
// State_StartFaceGoal.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_StartFaceGoal.h"

#include "State_StartFaceGoal_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

StartFaceGoal::StartFaceGoal(const char *name): CLState(name, *new StartFaceGoal::OnEntry, *new StartFaceGoal::OnExit, *new StartFaceGoal::Internal)
{
	_transitions[0] = new Transition_0();
}

StartFaceGoal::~StartFaceGoal()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartFaceGoal::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartFaceGoal_VarRefs.mm"
#	include "State_StartFaceGoal_OnEntry.mm"
}

void StartFaceGoal::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartFaceGoal_VarRefs.mm"
#	include "State_StartFaceGoal_OnExit.mm"
}

void StartFaceGoal::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartFaceGoal_VarRefs.mm"
#	include "State_StartFaceGoal_Internal.mm"
}

bool StartFaceGoal::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartFaceGoal_VarRefs.mm"

	return
	(
#		include "State_StartFaceGoal_Transition_0.expr"
	);
}
