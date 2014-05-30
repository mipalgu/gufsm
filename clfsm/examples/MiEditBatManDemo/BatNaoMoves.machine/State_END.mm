//
// State_END.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNaoMoves_Includes.h"
#include "BatNaoMoves.h"
#include "State_END.h"

#include "State_END_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNaoMoves;
using namespace State;

END::END(const char *name): CLState(name, *new END::OnEntry, *new END::OnExit, *new END::Internal)
{
	_transitions[0] = new Transition_0();
}

END::~END()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void END::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_END_VarRefs.mm"
#	include "State_END_OnEntry.mm"
}

void END::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_END_VarRefs.mm"
#	include "State_END_OnExit.mm"
}

void END::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_END_VarRefs.mm"
#	include "State_END_Internal.mm"
}

bool END::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_END_VarRefs.mm"

	return
	(
#		include "State_END_Transition_0.expr"
	);
}
