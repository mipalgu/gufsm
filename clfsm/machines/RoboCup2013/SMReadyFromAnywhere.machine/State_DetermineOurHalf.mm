//
// State_DetermineOurHalf.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_DetermineOurHalf.h"

#include "State_DetermineOurHalf_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

DetermineOurHalf::DetermineOurHalf(const char *name): CLState(name, *new DetermineOurHalf::OnEntry, *new DetermineOurHalf::OnExit, *new DetermineOurHalf::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

DetermineOurHalf::~DetermineOurHalf()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void DetermineOurHalf::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DetermineOurHalf_VarRefs.mm"
#	include "State_DetermineOurHalf_OnEntry.mm"
}

void DetermineOurHalf::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DetermineOurHalf_VarRefs.mm"
#	include "State_DetermineOurHalf_OnExit.mm"
}

void DetermineOurHalf::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DetermineOurHalf_VarRefs.mm"
#	include "State_DetermineOurHalf_Internal.mm"
}

bool DetermineOurHalf::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DetermineOurHalf_VarRefs.mm"

	return
	(
#		include "State_DetermineOurHalf_Transition_0.expr"
	);
}

bool DetermineOurHalf::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_DetermineOurHalf_VarRefs.mm"

	return
	(
#		include "State_DetermineOurHalf_Transition_1.expr"
	);
}
