//
// State_Init.mm -- 2013-04-09 01:54:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Safety_BatteryMonitor_Includes.h"
#include "Safety_BatteryMonitor.h"
#include "State_Init.h"

#include "State_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Init::Init(const char *name): CLState(name, *new Init::OnEntry, *new Init::OnExit, *new Init::Internal)
{
	_transitions[0] = new Transition_0();
}

Init::~Init()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnEntry.mm"
}

void Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_OnExit.mm"
}

void Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "State_Init_Internal.mm"
}

bool Init::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Init_VarRefs.mm"

	return
	(
#		include "State_Init_Transition_0.expr"
	);
}
