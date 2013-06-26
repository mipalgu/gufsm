//
// State_SpinAround.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_SpinAround.h"

#include "State_SpinAround_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

SpinAround::SpinAround(const char *name): CLState(name, *new SpinAround::OnEntry, *new SpinAround::OnExit, *new SpinAround::Internal)
{
	_transitions[0] = new Transition_0();
}

SpinAround::~SpinAround()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SpinAround::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_SpinAround_VarRefs.mm"
#	include "State_SpinAround_OnEntry.mm"
}

void SpinAround::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_SpinAround_VarRefs.mm"
#	include "State_SpinAround_OnExit.mm"
}

void SpinAround::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_SpinAround_VarRefs.mm"
#	include "State_SpinAround_Internal.mm"
}

bool SpinAround::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_SpinAround_VarRefs.mm"

	return
	(
#		include "State_SpinAround_Transition_0.expr"
	);
}
