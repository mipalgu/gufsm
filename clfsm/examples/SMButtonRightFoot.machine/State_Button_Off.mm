//
// State_Button_Off.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonRightFoot_Includes.h"
#include "SMButtonRightFoot.h"
#include "State_Button_Off.h"

#include "State_Button_Off_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMButtonRightFoot;
using namespace State;

Button_Off::Button_Off(const char *name): CLState(name, *new Button_Off::OnEntry, *new Button_Off::OnExit, *new Button_Off::Internal)
{
	_transitions[0] = new Transition_0();
}

Button_Off::~Button_Off()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Button_Off::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonRightFoot_VarRefs.mm"
#	include "State_Button_Off_VarRefs.mm"
#	include "State_Button_Off_OnEntry.mm"
}

void Button_Off::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonRightFoot_VarRefs.mm"
#	include "State_Button_Off_VarRefs.mm"
#	include "State_Button_Off_OnExit.mm"
}

void Button_Off::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonRightFoot_VarRefs.mm"
#	include "State_Button_Off_VarRefs.mm"
#	include "State_Button_Off_Internal.mm"
}

bool Button_Off::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonRightFoot_VarRefs.mm"
#	include "State_Button_Off_VarRefs.mm"

	return
	(
#		include "State_Button_Off_Transition_0.expr"
	);
}
