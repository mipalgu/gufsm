//
// State_WALK_ABOUT.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNao_Includes.h"
#include "BatNao.h"
#include "State_WALK_ABOUT.h"

#include "State_WALK_ABOUT_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNao;
using namespace State;

WALK_ABOUT::WALK_ABOUT(const char *name): CLState(name, *new WALK_ABOUT::OnEntry, *new WALK_ABOUT::OnExit, *new WALK_ABOUT::Internal)
{
	_transitions[0] = new Transition_0();
}

WALK_ABOUT::~WALK_ABOUT()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WALK_ABOUT::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_WALK_ABOUT_VarRefs.mm"
#	include "State_WALK_ABOUT_OnEntry.mm"
}

void WALK_ABOUT::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_WALK_ABOUT_VarRefs.mm"
#	include "State_WALK_ABOUT_OnExit.mm"
}

void WALK_ABOUT::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_WALK_ABOUT_VarRefs.mm"
#	include "State_WALK_ABOUT_Internal.mm"
}

bool WALK_ABOUT::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_WALK_ABOUT_VarRefs.mm"

	return
	(
#		include "State_WALK_ABOUT_Transition_0.expr"
	);
}
