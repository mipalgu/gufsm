//
// State_WalkAllTheWay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_WalkAllTheWay.h"

#include "State_WalkAllTheWay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

WalkAllTheWay::WalkAllTheWay(const char *name): CLState(name, *new WalkAllTheWay::OnEntry, *new WalkAllTheWay::OnExit, *new WalkAllTheWay::Internal)
{
	_transitions[0] = new Transition_0();
}

WalkAllTheWay::~WalkAllTheWay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WalkAllTheWay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_WalkAllTheWay_VarRefs.mm"
#	include "State_WalkAllTheWay_OnEntry.mm"
}

void WalkAllTheWay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_WalkAllTheWay_VarRefs.mm"
#	include "State_WalkAllTheWay_OnExit.mm"
}

void WalkAllTheWay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_WalkAllTheWay_VarRefs.mm"
#	include "State_WalkAllTheWay_Internal.mm"
}

bool WalkAllTheWay::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_WalkAllTheWay_VarRefs.mm"

	return
	(
#		include "State_WalkAllTheWay_Transition_0.expr"
	);
}
