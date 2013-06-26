//
// State_rightVisible.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_rightVisible.h"

#include "State_rightVisible_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

rightVisible::rightVisible(const char *name): CLState(name, *new rightVisible::OnEntry, *new rightVisible::OnExit, *new rightVisible::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

rightVisible::~rightVisible()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void rightVisible::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_rightVisible_VarRefs.mm"
#	include "State_rightVisible_OnEntry.mm"
}

void rightVisible::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_rightVisible_VarRefs.mm"
#	include "State_rightVisible_OnExit.mm"
}

void rightVisible::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_rightVisible_VarRefs.mm"
#	include "State_rightVisible_Internal.mm"
}

bool rightVisible::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_rightVisible_VarRefs.mm"

	return
	(
#		include "State_rightVisible_Transition_0.expr"
	);
}

bool rightVisible::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_rightVisible_VarRefs.mm"

	return
	(
#		include "State_rightVisible_Transition_1.expr"
	);
}
