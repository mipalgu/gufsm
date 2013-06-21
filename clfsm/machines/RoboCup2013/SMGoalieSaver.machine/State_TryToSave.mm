//
// State_TryToSave.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_TryToSave.h"

#include "State_TryToSave_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

TryToSave::TryToSave(const char *name): CLState(name, *new TryToSave::OnEntry, *new TryToSave::OnExit, *new TryToSave::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

TryToSave::~TryToSave()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void TryToSave::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_OnEntry.mm"
}

void TryToSave::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_OnExit.mm"
}

void TryToSave::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_Internal.mm"
}

bool TryToSave::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"

	return
	(
#		include "State_TryToSave_Transition_0.expr"
	);
}

bool TryToSave::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"

	return
	(
#		include "State_TryToSave_Transition_1.expr"
	);
}

bool TryToSave::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"

	return
	(
#		include "State_TryToSave_Transition_2.expr"
	);
}
