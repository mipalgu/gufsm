//
// State_Spin.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_Spin.h"

#include "State_Spin_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

Spin::Spin(const char *name): CLState(name, *new Spin::OnEntry, *new Spin::OnExit, *new Spin::Internal)
{
	_transitions[0] = new Transition_0();
}

Spin::~Spin()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Spin::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Spin_VarRefs.mm"
#	include "State_Spin_OnEntry.mm"
}

void Spin::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Spin_VarRefs.mm"
#	include "State_Spin_OnExit.mm"
}

void Spin::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Spin_VarRefs.mm"
#	include "State_Spin_Internal.mm"
}

bool Spin::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Spin_VarRefs.mm"

	return
	(
#		include "State_Spin_Transition_0.expr"
	);
}
