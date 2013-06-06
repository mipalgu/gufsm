//
// State_First_motion.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_First_motion.h"

#include "State_First_motion_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

First_motion::First_motion(const char *name): CLState(name, *new First_motion::OnEntry, *new First_motion::OnExit, *new First_motion::Internal)
{
	_transitions[0] = new Transition_0();
}

First_motion::~First_motion()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void First_motion::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_motion_VarRefs.mm"
#	include "State_First_motion_OnEntry.mm"
}

void First_motion::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_motion_VarRefs.mm"
#	include "State_First_motion_OnExit.mm"
}

void First_motion::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_motion_VarRefs.mm"
#	include "State_First_motion_Internal.mm"
}

bool First_motion::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_First_motion_VarRefs.mm"

	return
	(
#		include "State_First_motion_Transition_0.expr"
	);
}
