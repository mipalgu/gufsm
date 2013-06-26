//
// State_Start.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalie_Includes.h"
#include "SMGoalie.h"
#include "State_Start.h"

#include "State_Start_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalie;
using namespace State;

Start::Start(const char *name): CLState(name, *new Start::OnEntry, *new Start::OnExit, *new Start::Internal)
{
	_transitions[0] = new Transition_0();
}

Start::~Start()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Start::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnEntry.mm"
}

void Start::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_OnExit.mm"
}

void Start::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_Start_VarRefs.mm"
#	include "State_Start_Internal.mm"
}

bool Start::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalie_VarRefs.mm"
#	include "State_Start_VarRefs.mm"

	return
	(
#		include "State_Start_Transition_0.expr"
	);
}
