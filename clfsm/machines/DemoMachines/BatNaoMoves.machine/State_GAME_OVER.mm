//
// State_GAME_OVER.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNaoMoves_Includes.h"
#include "BatNaoMoves.h"
#include "State_GAME_OVER.h"

#include "State_GAME_OVER_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNaoMoves;
using namespace State;

GAME_OVER::GAME_OVER(const char *name): CLState(name, *new GAME_OVER::OnEntry, *new GAME_OVER::OnExit, *new GAME_OVER::Internal)
{
	_transitions[0] = new Transition_0();
}

GAME_OVER::~GAME_OVER()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void GAME_OVER::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_GAME_OVER_VarRefs.mm"
#	include "State_GAME_OVER_OnEntry.mm"
}

void GAME_OVER::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_GAME_OVER_VarRefs.mm"
#	include "State_GAME_OVER_OnExit.mm"
}

void GAME_OVER::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_GAME_OVER_VarRefs.mm"
#	include "State_GAME_OVER_Internal.mm"
}

bool GAME_OVER::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_GAME_OVER_VarRefs.mm"

	return
	(
#		include "State_GAME_OVER_Transition_0.expr"
	);
}
