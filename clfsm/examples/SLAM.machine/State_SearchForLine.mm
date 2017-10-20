//
// State_SearchForLine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_SearchForLine.h"

#include "State_SearchForLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

SearchForLine::SearchForLine(const char *name): CLState(name, *new SearchForLine::OnEntry, *new SearchForLine::OnExit, *new SearchForLine::Internal)
{
	_transitions[0] = new Transition_0();
}

SearchForLine::~SearchForLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SearchForLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_SearchForLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_SearchForLine_FuncRefs.mm"
#	include "State_SearchForLine_OnEntry.mm"
}

void SearchForLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_SearchForLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_SearchForLine_FuncRefs.mm"
#	include "State_SearchForLine_OnExit.mm"
}

void SearchForLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_SearchForLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_SearchForLine_FuncRefs.mm"
#	include "State_SearchForLine_Internal.mm"
}

bool SearchForLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_SearchForLine_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_SearchForLine_FuncRefs.mm"

	return
	(
#		include "State_SearchForLine_Transition_0.expr"
	);
}
