//
// State_SONAR_VALUES.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNao_Includes.h"
#include "BatNao.h"
#include "State_SONAR_VALUES.h"

#include "State_SONAR_VALUES_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNao;
using namespace State;

SONAR_VALUES::SONAR_VALUES(const char *name): CLState(name, *new SONAR_VALUES::OnEntry, *new SONAR_VALUES::OnExit, *new SONAR_VALUES::Internal)
{
	_transitions[0] = new Transition_0();
}

SONAR_VALUES::~SONAR_VALUES()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SONAR_VALUES::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_SONAR_VALUES_VarRefs.mm"
#	include "State_SONAR_VALUES_OnEntry.mm"
}

void SONAR_VALUES::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_SONAR_VALUES_VarRefs.mm"
#	include "State_SONAR_VALUES_OnExit.mm"
}

void SONAR_VALUES::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_SONAR_VALUES_VarRefs.mm"
#	include "State_SONAR_VALUES_Internal.mm"
}

bool SONAR_VALUES::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNao_VarRefs.mm"
#	include "State_SONAR_VALUES_VarRefs.mm"

	return
	(
#		include "State_SONAR_VALUES_Transition_0.expr"
	);
}
