//
// State_check_ifVisible.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"
#include "State_check_ifVisible.h"

#include "State_check_ifVisible_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayerGoal;
using namespace State;

check_ifVisible::check_ifVisible(const char *name): CLState(name, *new check_ifVisible::OnEntry, *new check_ifVisible::OnExit, *new check_ifVisible::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

check_ifVisible::~check_ifVisible()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void check_ifVisible::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_check_ifVisible_VarRefs.mm"
#	include "State_check_ifVisible_OnEntry.mm"
}

void check_ifVisible::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_check_ifVisible_VarRefs.mm"
#	include "State_check_ifVisible_OnExit.mm"
}

void check_ifVisible::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_check_ifVisible_VarRefs.mm"
#	include "State_check_ifVisible_Internal.mm"
}

bool check_ifVisible::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_check_ifVisible_VarRefs.mm"

	return
	(
#		include "State_check_ifVisible_Transition_0.expr"
	);
}

bool check_ifVisible::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_check_ifVisible_VarRefs.mm"

	return
	(
#		include "State_check_ifVisible_Transition_1.expr"
	);
}
