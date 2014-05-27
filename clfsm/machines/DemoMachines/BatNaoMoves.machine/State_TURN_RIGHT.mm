//
// State_TURN_RIGHT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNaoMoves_Includes.h"
#include "BatNaoMoves.h"
#include "State_TURN_RIGHT.h"

#include "State_TURN_RIGHT_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNaoMoves;
using namespace State;

TURN_RIGHT::TURN_RIGHT(const char *name): CLState(name, *new TURN_RIGHT::OnEntry, *new TURN_RIGHT::OnExit, *new TURN_RIGHT::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

TURN_RIGHT::~TURN_RIGHT()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void TURN_RIGHT::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_TURN_RIGHT_VarRefs.mm"
#	include "State_TURN_RIGHT_OnEntry.mm"
}

void TURN_RIGHT::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_TURN_RIGHT_VarRefs.mm"
#	include "State_TURN_RIGHT_OnExit.mm"
}

void TURN_RIGHT::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_TURN_RIGHT_VarRefs.mm"
#	include "State_TURN_RIGHT_Internal.mm"
}

bool TURN_RIGHT::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_TURN_RIGHT_VarRefs.mm"

	return
	(
#		include "State_TURN_RIGHT_Transition_0.expr"
	);
}

bool TURN_RIGHT::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_TURN_RIGHT_VarRefs.mm"

	return
	(
#		include "State_TURN_RIGHT_Transition_1.expr"
	);
}
