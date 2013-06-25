//
// State_SaveFinished.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_SaveFinished.h"

#include "State_SaveFinished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

SaveFinished::SaveFinished(const char *name): CLState(name, *new SaveFinished::OnEntry, *new SaveFinished::OnExit, *new SaveFinished::Internal)
{
	_transitions[0] = new Transition_0();
}

SaveFinished::~SaveFinished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SaveFinished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveFinished_VarRefs.mm"
#	include "State_SaveFinished_OnEntry.mm"
}

void SaveFinished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveFinished_VarRefs.mm"
#	include "State_SaveFinished_OnExit.mm"
}

void SaveFinished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveFinished_VarRefs.mm"
#	include "State_SaveFinished_Internal.mm"
}

bool SaveFinished::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_SaveFinished_VarRefs.mm"

	return
	(
#		include "State_SaveFinished_Transition_0.expr"
	);
}
