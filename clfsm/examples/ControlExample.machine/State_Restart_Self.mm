//
// State_Restart_Self.mm -- 2013-04-12 00:42:51 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "ControlExample_Includes.h"
#include "ControlExample.h"
#include "State_Restart_Self.h"

#include "State_Restart_Self_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Restart_Self::Restart_Self(const char *name): CLState(name, *new Restart_Self::OnEntry, *new Restart_Self::OnExit, *new Restart_Self::Internal)
{
}

Restart_Self::~Restart_Self()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Restart_Self::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_Self_VarRefs.mm"
#	include "State_Restart_Self_OnEntry.mm"
}

void Restart_Self::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_Self_VarRefs.mm"
#	include "State_Restart_Self_OnExit.mm"
}

void Restart_Self::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ControlExample_VarRefs.mm"
#	include "State_Restart_Self_VarRefs.mm"
#	include "State_Restart_Self_Internal.mm"
}
