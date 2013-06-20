//
// State_Check.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_Check.h"

#include "State_Check_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

Check::Check(const char *name): CLState(name, *new Check::OnEntry, *new Check::OnExit, *new Check::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

Check::~Check()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void Check::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "State_Check_OnEntry.mm"
}

void Check::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "State_Check_OnExit.mm"
}

void Check::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "State_Check_Internal.mm"
}

bool Check::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Check_VarRefs.mm"

	return
	(
#		include "State_Check_Transition_0.expr"
	);
}

bool Check::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_Check_VarRefs.mm"

	return
	(
#		include "State_Check_Transition_1.expr"
	);
}
