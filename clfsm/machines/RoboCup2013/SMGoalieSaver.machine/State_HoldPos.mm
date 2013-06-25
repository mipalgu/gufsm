//
// State_HoldPos.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_HoldPos.h"

#include "State_HoldPos_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

HoldPos::HoldPos(const char *name): CLState(name, *new HoldPos::OnEntry, *new HoldPos::OnExit, *new HoldPos::Internal)
{
	_transitions[0] = new Transition_0();
}

HoldPos::~HoldPos()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HoldPos::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_HoldPos_VarRefs.mm"
#	include "State_HoldPos_OnEntry.mm"
}

void HoldPos::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_HoldPos_VarRefs.mm"
#	include "State_HoldPos_OnExit.mm"
}

void HoldPos::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_HoldPos_VarRefs.mm"
#	include "State_HoldPos_Internal.mm"
}

bool HoldPos::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_HoldPos_VarRefs.mm"

	return
	(
#		include "State_HoldPos_Transition_0.expr"
	);
}
