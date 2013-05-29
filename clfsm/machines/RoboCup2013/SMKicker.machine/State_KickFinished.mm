//
// State_KickFinished.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMKicker_Includes.h"
#include "SMKicker.h"
#include "State_KickFinished.h"

#include "State_KickFinished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMKicker;
using namespace State;

KickFinished::KickFinished(const char *name): CLState(name, *new KickFinished::OnEntry, *new KickFinished::OnExit, *new KickFinished::Internal)
{
}

KickFinished::~KickFinished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void KickFinished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickFinished_VarRefs.mm"
#	include "State_KickFinished_OnEntry.mm"
}

void KickFinished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickFinished_VarRefs.mm"
#	include "State_KickFinished_OnExit.mm"
}

void KickFinished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMKicker_VarRefs.mm"
#	include "State_KickFinished_VarRefs.mm"
#	include "State_KickFinished_Internal.mm"
}
