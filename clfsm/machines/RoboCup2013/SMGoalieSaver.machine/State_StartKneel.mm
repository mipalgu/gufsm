//
// State_StartKneel.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_StartKneel.h"

#include "State_StartKneel_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

StartKneel::StartKneel(const char *name): CLState(name, *new StartKneel::OnEntry, *new StartKneel::OnExit, *new StartKneel::Internal)
{
	_transitions[0] = new Transition_0();
}

StartKneel::~StartKneel()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartKneel::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartKneel_VarRefs.mm"
#	include "State_StartKneel_OnEntry.mm"
}

void StartKneel::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartKneel_VarRefs.mm"
#	include "State_StartKneel_OnExit.mm"
}

void StartKneel::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartKneel_VarRefs.mm"
#	include "State_StartKneel_Internal.mm"
}

bool StartKneel::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_StartKneel_VarRefs.mm"

	return
	(
#		include "State_StartKneel_Transition_0.expr"
	);
}
