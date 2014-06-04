//
// State_START_SONAR.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "BatNaoMoves_Includes.h"
#include "BatNaoMoves.h"
#include "State_START_SONAR.h"

#include "State_START_SONAR_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBatNaoMoves;
using namespace State;

START_SONAR::START_SONAR(const char *name): CLState(name, *new START_SONAR::OnEntry, *new START_SONAR::OnExit, *new START_SONAR::Internal)
{
	_transitions[0] = new Transition_0();
}

START_SONAR::~START_SONAR()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void START_SONAR::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_START_SONAR_VarRefs.mm"
#	include "State_START_SONAR_OnEntry.mm"
}

void START_SONAR::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_START_SONAR_VarRefs.mm"
#	include "State_START_SONAR_OnExit.mm"
}

void START_SONAR::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_START_SONAR_VarRefs.mm"
#	include "State_START_SONAR_Internal.mm"
}

bool START_SONAR::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BatNaoMoves_VarRefs.mm"
#	include "State_START_SONAR_VarRefs.mm"

	return
	(
#		include "State_START_SONAR_Transition_0.expr"
	);
}
