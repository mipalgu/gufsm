//
// State_GoToLine.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromInitial_Includes.h"
#include "SMReadyFromInitial.h"
#include "State_GoToLine.h"

#include "State_GoToLine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromInitial;
using namespace State;

GoToLine::GoToLine(const char *name): CLState(name, *new GoToLine::OnEntry, *new GoToLine::OnExit, *new GoToLine::Internal)
{
}

GoToLine::~GoToLine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void GoToLine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_OnEntry.mm"
}

void GoToLine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_OnExit.mm"
}

void GoToLine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromInitial_VarRefs.mm"
#	include "State_GoToLine_VarRefs.mm"
#	include "State_GoToLine_Internal.mm"
}
