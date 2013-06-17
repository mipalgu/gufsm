//
// State_WalkSeek.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_WalkSeek.h"

#include "State_WalkSeek_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

WalkSeek::WalkSeek(const char *name): CLState(name, *new WalkSeek::OnEntry, *new WalkSeek::OnExit, *new WalkSeek::Internal)
{
}

WalkSeek::~WalkSeek()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void WalkSeek::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkSeek_VarRefs.mm"
#	include "State_WalkSeek_OnEntry.mm"
}

void WalkSeek::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkSeek_VarRefs.mm"
#	include "State_WalkSeek_OnExit.mm"
}

void WalkSeek::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_WalkSeek_VarRefs.mm"
#	include "State_WalkSeek_Internal.mm"
}
