//
// State_leftVisible.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_leftVisible.h"

#include "State_leftVisible_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

leftVisible::leftVisible(const char *name): CLState(name, *new leftVisible::OnEntry, *new leftVisible::OnExit, *new leftVisible::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

leftVisible::~leftVisible()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void leftVisible::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_leftVisible_VarRefs.mm"
#	include "State_leftVisible_OnEntry.mm"
}

void leftVisible::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_leftVisible_VarRefs.mm"
#	include "State_leftVisible_OnExit.mm"
}

void leftVisible::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_leftVisible_VarRefs.mm"
#	include "State_leftVisible_Internal.mm"
}

bool leftVisible::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_leftVisible_VarRefs.mm"

	return
	(
#		include "State_leftVisible_Transition_0.expr"
	);
}

bool leftVisible::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_leftVisible_VarRefs.mm"

	return
	(
#		include "State_leftVisible_Transition_1.expr"
	);
}
