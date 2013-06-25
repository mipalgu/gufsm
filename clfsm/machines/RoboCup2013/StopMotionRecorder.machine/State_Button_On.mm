//
// State_Button_On.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StopMotionRecorder_Includes.h"
#include "StopMotionRecorder.h"
#include "State_Button_On.h"

#include "State_Button_On_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStopMotionRecorder;
using namespace State;

Button_On::Button_On(const char *name): CLState(name, *new Button_On::OnEntry, *new Button_On::OnExit, *new Button_On::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Button_On::~Button_On()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Button_On::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StopMotionRecorder_VarRefs.mm"
#	include "State_Button_On_VarRefs.mm"
#	include "State_Button_On_OnEntry.mm"
}

void Button_On::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StopMotionRecorder_VarRefs.mm"
#	include "State_Button_On_VarRefs.mm"
#	include "State_Button_On_OnExit.mm"
}

void Button_On::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StopMotionRecorder_VarRefs.mm"
#	include "State_Button_On_VarRefs.mm"
#	include "State_Button_On_Internal.mm"
}

bool Button_On::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StopMotionRecorder_VarRefs.mm"
#	include "State_Button_On_VarRefs.mm"

	return
	(
#		include "State_Button_On_Transition_0.expr"
	);
}

bool Button_On::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "StopMotionRecorder_VarRefs.mm"
#	include "State_Button_On_VarRefs.mm"

	return
	(
#		include "State_Button_On_Transition_1.expr"
	);
}
