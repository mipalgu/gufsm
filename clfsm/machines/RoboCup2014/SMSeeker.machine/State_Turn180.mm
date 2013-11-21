//
// State_Turn180.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_Turn180.h"

#include "State_Turn180_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

Turn180::Turn180(const char *name): CLState(name, *new Turn180::OnEntry, *new Turn180::OnExit, *new Turn180::Internal)
{
	_transitions[0] = new Transition_0();
}

Turn180::~Turn180()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Turn180::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Turn180_VarRefs.mm"
#	include "State_Turn180_OnEntry.mm"
}

void Turn180::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Turn180_VarRefs.mm"
#	include "State_Turn180_OnExit.mm"
}

void Turn180::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Turn180_VarRefs.mm"
#	include "State_Turn180_Internal.mm"
}

bool Turn180::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Turn180_VarRefs.mm"

	return
	(
#		include "State_Turn180_Transition_0.expr"
	);
}
