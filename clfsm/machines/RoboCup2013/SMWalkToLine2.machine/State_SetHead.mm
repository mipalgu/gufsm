//
// State_SetHead.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkToLine2_Includes.h"
#include "SMWalkToLine2.h"
#include "State_SetHead.h"

#include "State_SetHead_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkToLine2;
using namespace State;

SetHead::SetHead(const char *name): CLState(name, *new SetHead::OnEntry, *new SetHead::OnExit, *new SetHead::Internal)
{
	_transitions[0] = new Transition_0();
}

SetHead::~SetHead()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetHead::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetHead_VarRefs.mm"
#	include "State_SetHead_OnEntry.mm"
}

void SetHead::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetHead_VarRefs.mm"
#	include "State_SetHead_OnExit.mm"
}

void SetHead::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetHead_VarRefs.mm"
#	include "State_SetHead_Internal.mm"
}

bool SetHead::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_SetHead_VarRefs.mm"

	return
	(
#		include "State_SetHead_Transition_0.expr"
	);
}
