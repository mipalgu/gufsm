//
// State_FoundConstDir.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_FoundConstDir.h"

#include "State_FoundConstDir_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

FoundConstDir::FoundConstDir(const char *name): CLState(name, *new FoundConstDir::OnEntry, *new FoundConstDir::OnExit, *new FoundConstDir::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

FoundConstDir::~FoundConstDir()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void FoundConstDir::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_FoundConstDir_VarRefs.mm"
#	include "State_FoundConstDir_OnEntry.mm"
}

void FoundConstDir::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_FoundConstDir_VarRefs.mm"
#	include "State_FoundConstDir_OnExit.mm"
}

void FoundConstDir::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_FoundConstDir_VarRefs.mm"
#	include "State_FoundConstDir_Internal.mm"
}

bool FoundConstDir::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_FoundConstDir_VarRefs.mm"

	return
	(
#		include "State_FoundConstDir_Transition_0.expr"
	);
}

bool FoundConstDir::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_FoundConstDir_VarRefs.mm"

	return
	(
#		include "State_FoundConstDir_Transition_1.expr"
	);
}
