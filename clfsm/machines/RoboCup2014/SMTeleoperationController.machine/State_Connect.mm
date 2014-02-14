//
// State_Connect.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperationController_Includes.h"
#include "SMTeleoperationController.h"
#include "State_Connect.h"

#include "State_Connect_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperationController;
using namespace State;

Connect::Connect(const char *name): CLState(name, *new Connect::OnEntry, *new Connect::OnExit, *new Connect::Internal)
{
	_transitions[0] = new Transition_0();
}

Connect::~Connect()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Connect::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Connect_VarRefs.mm"
#	include "State_Connect_OnEntry.mm"
}

void Connect::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Connect_VarRefs.mm"
#	include "State_Connect_OnExit.mm"
}

void Connect::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Connect_VarRefs.mm"
#	include "State_Connect_Internal.mm"
}

bool Connect::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperationController_VarRefs.mm"
#	include "State_Connect_VarRefs.mm"

	return
	(
#		include "State_Connect_Transition_0.expr"
	);
}
