//
// State_Done.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "RobotPosition_Includes.h"
#include "RobotPosition.h"
#include "State_Done.h"

#include "State_Done_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMRobotPosition;
using namespace State;

Done::Done(const char *name): CLState(name, *new Done::OnEntry, *new Done::OnExit, *new Done::Internal)
{
	_transitions[0] = new Transition_0();
}

Done::~Done()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Done::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "State_Done_OnEntry.mm"
}

void Done::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "State_Done_OnExit.mm"
}

void Done::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_Done_VarRefs.mm"
#	include "State_Done_Internal.mm"
}

bool Done::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "RobotPosition_VarRefs.mm"
#	include "State_Done_VarRefs.mm"

	return
	(
#		include "State_Done_Transition_0.expr"
	);
}
