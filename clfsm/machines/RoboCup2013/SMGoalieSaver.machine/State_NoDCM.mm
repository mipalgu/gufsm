//
// State_NoDCM.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_NoDCM.h"

#include "State_NoDCM_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

NoDCM::NoDCM(const char *name): CLState(name, *new NoDCM::OnEntry, *new NoDCM::OnExit, *new NoDCM::Internal)
{
	_transitions[0] = new Transition_0();
}

NoDCM::~NoDCM()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void NoDCM::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_NoDCM_VarRefs.mm"
#	include "State_NoDCM_OnEntry.mm"
}

void NoDCM::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_NoDCM_VarRefs.mm"
#	include "State_NoDCM_OnExit.mm"
}

void NoDCM::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_NoDCM_VarRefs.mm"
#	include "State_NoDCM_Internal.mm"
}

bool NoDCM::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_NoDCM_VarRefs.mm"

	return
	(
#		include "State_NoDCM_Transition_0.expr"
	);
}
