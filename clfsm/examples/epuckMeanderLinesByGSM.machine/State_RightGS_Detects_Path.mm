//
// State_RightGS_Detects_Path.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "epuckMeanderLinesByGSM_Includes.h"
#include "epuckMeanderLinesByGSM.h"
#include "State_RightGS_Detects_Path.h"

#include "State_RightGS_Detects_Path_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMepuckMeanderLinesByGSM;
using namespace State;

RightGS_Detects_Path::RightGS_Detects_Path(const char *name): CLState(name, *new RightGS_Detects_Path::OnEntry, *new RightGS_Detects_Path::OnExit, *new RightGS_Detects_Path::Internal)
{
	_transitions[0] = new Transition_0();
}

RightGS_Detects_Path::~RightGS_Detects_Path()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RightGS_Detects_Path::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "epuckMeanderLinesByGSM_VarRefs.mm"
#	include "State_RightGS_Detects_Path_VarRefs.mm"
#	include "State_RightGS_Detects_Path_OnEntry.mm"
}

void RightGS_Detects_Path::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "epuckMeanderLinesByGSM_VarRefs.mm"
#	include "State_RightGS_Detects_Path_VarRefs.mm"
#	include "State_RightGS_Detects_Path_OnExit.mm"
}

void RightGS_Detects_Path::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "epuckMeanderLinesByGSM_VarRefs.mm"
#	include "State_RightGS_Detects_Path_VarRefs.mm"
#	include "State_RightGS_Detects_Path_Internal.mm"
}

bool RightGS_Detects_Path::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "epuckMeanderLinesByGSM_VarRefs.mm"
#	include "State_RightGS_Detects_Path_VarRefs.mm"

	return
	(
#		include "State_RightGS_Detects_Path_Transition_0.expr"
	);
}
