//
// State_Print_Name.mm -- 2013-04-15 04:08:33 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Print_Name.h"

#include "State_Print_Name_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMControlExample;
using namespace State;

Print_Name::Print_Name(const char *name): CLState(name, *new Print_Name::OnEntry, *new Print_Name::OnExit, *new Print_Name::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Print_Name::~Print_Name()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Print_Name::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Print_Name_VarRefs.mm"
#	include "State_Print_Name_OnEntry.mm"
}

void Print_Name::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Print_Name_VarRefs.mm"
#	include "State_Print_Name_OnExit.mm"
}

void Print_Name::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Print_Name_VarRefs.mm"
#	include "State_Print_Name_Internal.mm"
}

bool Print_Name::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Print_Name_VarRefs.mm"

	return
	(
#		include "State_Print_Name_Transition_0.expr"
	);
}

bool Print_Name::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Print_Name_VarRefs.mm"

	return
	(
#		include "State_Print_Name_Transition_1.expr"
	);
}
