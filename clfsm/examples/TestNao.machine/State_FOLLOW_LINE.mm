//
// State_FOLLOW_LINE.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestNao_Includes.h"
#include "TestNao.h"
#include "State_FOLLOW_LINE.h"

#include "State_FOLLOW_LINE_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMTestNao;
using namespace State;

FOLLOW_LINE::FOLLOW_LINE(const char *name): CLState(name, *new FOLLOW_LINE::OnEntry, *new FOLLOW_LINE::OnExit, *new FOLLOW_LINE::Internal)
{
	_transitions[0] = new Transition_0();
}

FOLLOW_LINE::~FOLLOW_LINE()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FOLLOW_LINE::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestNao_VarRefs.mm"
#	include "State_FOLLOW_LINE_VarRefs.mm"
#	include "State_FOLLOW_LINE_OnEntry.mm"
}

void FOLLOW_LINE::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestNao_VarRefs.mm"
#	include "State_FOLLOW_LINE_VarRefs.mm"
#	include "State_FOLLOW_LINE_OnExit.mm"
}

void FOLLOW_LINE::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestNao_VarRefs.mm"
#	include "State_FOLLOW_LINE_VarRefs.mm"
#	include "State_FOLLOW_LINE_Internal.mm"
}

bool FOLLOW_LINE::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestNao_VarRefs.mm"
#	include "State_FOLLOW_LINE_VarRefs.mm"

	return
	(
#		include "State_FOLLOW_LINE_Transition_0.expr"
	);
}
