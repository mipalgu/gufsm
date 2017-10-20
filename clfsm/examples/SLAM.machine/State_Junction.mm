//
// State_Junction.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SLAM_Includes.h"
#include "SLAM.h"
#include "State_Junction.h"

#include "State_Junction_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSLAM;
using namespace State;

Junction::Junction(const char *name): CLState(name, *new Junction::OnEntry, *new Junction::OnExit, *new Junction::Internal)
{
	_transitions[0] = new Transition_0();
}

Junction::~Junction()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Junction::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Junction_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Junction_FuncRefs.mm"
#	include "State_Junction_OnEntry.mm"
}

void Junction::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Junction_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Junction_FuncRefs.mm"
#	include "State_Junction_OnExit.mm"
}

void Junction::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Junction_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Junction_FuncRefs.mm"
#	include "State_Junction_Internal.mm"
}

bool Junction::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SLAM_VarRefs.mm"
#	include "State_Junction_VarRefs.mm"
#	include "SLAM_FuncRefs.mm"
#	include "State_Junction_FuncRefs.mm"

	return
	(
#		include "State_Junction_Transition_0.expr"
	);
}
