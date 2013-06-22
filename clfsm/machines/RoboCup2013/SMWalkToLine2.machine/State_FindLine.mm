//
// State_FindLine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkToLine2_Includes.h"
#include "SMWalkToLine2.h"
#include "State_FindLine.h"

#include "State_FindLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkToLine2;
using namespace State;

FindLine::FindLine(const char *name): CLState(name, *new FindLine::OnEntry, *new FindLine::OnExit, *new FindLine::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

FindLine::~FindLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void FindLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_FindLine_VarRefs.mm"
#	include "State_FindLine_OnEntry.mm"
}

void FindLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_FindLine_VarRefs.mm"
#	include "State_FindLine_OnExit.mm"
}

void FindLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_FindLine_VarRefs.mm"
#	include "State_FindLine_Internal.mm"
}

bool FindLine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_FindLine_VarRefs.mm"

	return
	(
#		include "State_FindLine_Transition_0.expr"
	);
}

bool FindLine::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkToLine2_VarRefs.mm"
#	include "State_FindLine_VarRefs.mm"

	return
	(
#		include "State_FindLine_Transition_1.expr"
	);
}
