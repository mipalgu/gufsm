//
// State_Suspending_Scanner.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayerGoal_Includes.h"
#include "SMPlayerGoal.h"
#include "State_Suspending_Scanner.h"

#include "State_Suspending_Scanner_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayerGoal;
using namespace State;

Suspending_Scanner::Suspending_Scanner(const char *name): CLState(name, *new Suspending_Scanner::OnEntry, *new Suspending_Scanner::OnExit, *new Suspending_Scanner::Internal)
{
	_transitions[0] = new Transition_0();
}

Suspending_Scanner::~Suspending_Scanner()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Suspending_Scanner::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_Scanner_VarRefs.mm"
#	include "State_Suspending_Scanner_OnEntry.mm"
}

void Suspending_Scanner::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_Scanner_VarRefs.mm"
#	include "State_Suspending_Scanner_OnExit.mm"
}

void Suspending_Scanner::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_Scanner_VarRefs.mm"
#	include "State_Suspending_Scanner_Internal.mm"
}

bool Suspending_Scanner::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayerGoal_VarRefs.mm"
#	include "State_Suspending_Scanner_VarRefs.mm"

	return
	(
#		include "State_Suspending_Scanner_Transition_0.expr"
	);
}
