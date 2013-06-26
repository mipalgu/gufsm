//
// State_TooCloseSpinAround.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_TooCloseSpinAround.h"

#include "State_TooCloseSpinAround_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

TooCloseSpinAround::TooCloseSpinAround(const char *name): CLState(name, *new TooCloseSpinAround::OnEntry, *new TooCloseSpinAround::OnExit, *new TooCloseSpinAround::Internal)
{
	_transitions[0] = new Transition_0();
}

TooCloseSpinAround::~TooCloseSpinAround()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void TooCloseSpinAround::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_TooCloseSpinAround_VarRefs.mm"
#	include "State_TooCloseSpinAround_OnEntry.mm"
}

void TooCloseSpinAround::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_TooCloseSpinAround_VarRefs.mm"
#	include "State_TooCloseSpinAround_OnExit.mm"
}

void TooCloseSpinAround::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_TooCloseSpinAround_VarRefs.mm"
#	include "State_TooCloseSpinAround_Internal.mm"
}

bool TooCloseSpinAround::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_TooCloseSpinAround_VarRefs.mm"

	return
	(
#		include "State_TooCloseSpinAround_Transition_0.expr"
	);
}
