//
// State_ReadHeadingAgain.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_ReadHeadingAgain.h"

#include "State_ReadHeadingAgain_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

ReadHeadingAgain::ReadHeadingAgain(const char *name): CLState(name, *new ReadHeadingAgain::OnEntry, *new ReadHeadingAgain::OnExit, *new ReadHeadingAgain::Internal)
{
	_transitions[0] = new Transition_0();
}

ReadHeadingAgain::~ReadHeadingAgain()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ReadHeadingAgain::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_ReadHeadingAgain_VarRefs.mm"
#	include "State_ReadHeadingAgain_OnEntry.mm"
}

void ReadHeadingAgain::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_ReadHeadingAgain_VarRefs.mm"
#	include "State_ReadHeadingAgain_OnExit.mm"
}

void ReadHeadingAgain::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_ReadHeadingAgain_VarRefs.mm"
#	include "State_ReadHeadingAgain_Internal.mm"
}

bool ReadHeadingAgain::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_ReadHeadingAgain_VarRefs.mm"

	return
	(
#		include "State_ReadHeadingAgain_Transition_0.expr"
	);
}
