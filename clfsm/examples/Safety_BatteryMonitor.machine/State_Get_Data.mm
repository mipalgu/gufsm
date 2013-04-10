//
// State_Get_Data.mm -- 2013-04-09 01:54:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Safety_BatteryMonitor_Includes.h"
#include "Safety_BatteryMonitor.h"
#include "State_Get_Data.h"

#include "State_Get_Data_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Get_Data::Get_Data(const char *name): CLState(name, *new Get_Data::OnEntry, *new Get_Data::OnExit, *new Get_Data::Internal)
{
	_transitions[0] = new Transition_0();
}

Get_Data::~Get_Data()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Get_Data::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Get_Data_VarRefs.mm"
#	include "State_Get_Data_OnEntry.mm"
}

void Get_Data::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Get_Data_VarRefs.mm"
#	include "State_Get_Data_OnExit.mm"
}

void Get_Data::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Get_Data_VarRefs.mm"
#	include "State_Get_Data_Internal.mm"
}

bool Get_Data::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Safety_BatteryMonitor_VarRefs.mm"
#	include "State_Get_Data_VarRefs.mm"

	return
	(
#		include "State_Get_Data_Transition_0.expr"
	);
}
