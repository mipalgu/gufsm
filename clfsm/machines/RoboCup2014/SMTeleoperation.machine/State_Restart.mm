//
// State_Restart.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMTeleoperation_Includes.h"
#include "SMTeleoperation.h"
#include "State_Restart.h"

#include "State_Restart_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMTeleoperation;
using namespace State;

Restart::Restart(const char *name): CLState(name, *new Restart::OnEntry, *new Restart::OnExit, *new Restart::Internal)
{
}

Restart::~Restart()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Restart::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_OnEntry.mm"
}

void Restart::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_OnExit.mm"
}

void Restart::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMTeleoperation_VarRefs.mm"
#	include "State_Restart_VarRefs.mm"
#	include "State_Restart_Internal.mm"
}
