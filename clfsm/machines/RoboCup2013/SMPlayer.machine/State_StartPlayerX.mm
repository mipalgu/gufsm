//
// State_StartPlayerX.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMPlayer_Includes.h"
#include "SMPlayer.h"
#include "State_StartPlayerX.h"

#include "State_StartPlayerX_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMPlayer;
using namespace State;

StartPlayerX::StartPlayerX(const char *name): CLState(name, *new StartPlayerX::OnEntry, *new StartPlayerX::OnExit, *new StartPlayerX::Internal)
{
}

StartPlayerX::~StartPlayerX()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void StartPlayerX::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartPlayerX_VarRefs.mm"
#	include "State_StartPlayerX_OnEntry.mm"
}

void StartPlayerX::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartPlayerX_VarRefs.mm"
#	include "State_StartPlayerX_OnExit.mm"
}

void StartPlayerX::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMPlayer_VarRefs.mm"
#	include "State_StartPlayerX_VarRefs.mm"
#	include "State_StartPlayerX_Internal.mm"
}
