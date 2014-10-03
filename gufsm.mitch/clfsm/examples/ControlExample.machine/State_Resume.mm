//
// State_Resume.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Resume.h"

#include "State_Resume_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMControlExample;
using namespace State;

Resume::Resume(const char *name): CLState(name, *new Resume::OnEntry, *new Resume::OnExit, *new Resume::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Resume::~Resume()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Resume::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Resume_VarRefs.mm"
#	include "State_Resume_OnEntry.mm"
}

void Resume::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Resume_VarRefs.mm"
#	include "State_Resume_OnExit.mm"
}

void Resume::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Resume_VarRefs.mm"
#	include "State_Resume_Internal.mm"
}

bool Resume::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Resume_VarRefs.mm"

	return
	(
#		include "State_Resume_Transition_0.expr"
	);
}

bool Resume::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Resume_VarRefs.mm"

	return
	(
#		include "State_Resume_Transition_1.expr"
	);
}
