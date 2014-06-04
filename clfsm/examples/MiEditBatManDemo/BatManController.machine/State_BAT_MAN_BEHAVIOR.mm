//
// State_BAT_MAN_BEHAVIOR.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatManController_Includes.h"
#include "BatManController.h"
#include "State_BAT_MAN_BEHAVIOR.h"

#include "State_BAT_MAN_BEHAVIOR_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatManController;
using namespace State;

BAT_MAN_BEHAVIOR::BAT_MAN_BEHAVIOR(const char *name): CLState(name, *new BAT_MAN_BEHAVIOR::OnEntry, *new BAT_MAN_BEHAVIOR::OnExit, *new BAT_MAN_BEHAVIOR::Internal)
{
	_transitions[0] = new Transition_0();
}

BAT_MAN_BEHAVIOR::~BAT_MAN_BEHAVIOR()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void BAT_MAN_BEHAVIOR::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_OnEntry.mm"
}

void BAT_MAN_BEHAVIOR::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_OnExit.mm"
}

void BAT_MAN_BEHAVIOR::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_Internal.mm"
}

bool BAT_MAN_BEHAVIOR::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatManController_VarRefs.mm"
#	include "State_BAT_MAN_BEHAVIOR_VarRefs.mm"

	return
	(
#		include "State_BAT_MAN_BEHAVIOR_Transition_0.expr"
	);
}
