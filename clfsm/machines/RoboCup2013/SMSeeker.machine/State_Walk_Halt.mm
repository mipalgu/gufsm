//
// State_Walk_Halt.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_Walk_Halt.h"

#include "State_Walk_Halt_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

Walk_Halt::Walk_Halt(const char *name): CLState(name, *new Walk_Halt::OnEntry, *new Walk_Halt::OnExit, *new Walk_Halt::Internal)
{
}

Walk_Halt::~Walk_Halt()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Walk_Halt::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_OnEntry.mm"
}

void Walk_Halt::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_OnExit.mm"
}

void Walk_Halt::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_Walk_Halt_VarRefs.mm"
#	include "State_Walk_Halt_Internal.mm"
}
