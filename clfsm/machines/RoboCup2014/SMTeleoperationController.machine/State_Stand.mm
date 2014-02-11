//
// State_Stand.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_Stand.h"

#include "State_Stand_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

Stand::Stand(const char *name): CLState(name, *new Stand::OnEntry, *new Stand::OnExit, *new Stand::Internal)
{
	_transitions[0] = new Transition_0();
}

Stand::~Stand()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Stand::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Stand_VarRefs.mm"
#	include "State_Stand_OnEntry.mm"
}

void Stand::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Stand_VarRefs.mm"
#	include "State_Stand_OnExit.mm"
}

void Stand::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Stand_VarRefs.mm"
#	include "State_Stand_Internal.mm"
}

bool Stand::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Stand_VarRefs.mm"

	return
	(
#		include "State_Stand_Transition_0.expr"
	);
}
