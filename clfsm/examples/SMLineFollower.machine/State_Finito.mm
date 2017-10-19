//
// State_Finito.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SMLineFollower_Includes.h"
#include "SMLineFollower.h"
#include "State_Finito.h"

#include "State_Finito_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMLineFollower;
using namespace State;

Finito::Finito(const char *name): CLState(name, *new Finito::OnEntry, *new Finito::OnExit, *new Finito::Internal)
{
}

Finito::~Finito()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Finito::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Finito_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Finito_FuncRefs.mm"
#	include "State_Finito_OnEntry.mm"
}

void Finito::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Finito_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Finito_FuncRefs.mm"
#	include "State_Finito_OnExit.mm"
}

void Finito::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMLineFollower_VarRefs.mm"
#	include "State_Finito_VarRefs.mm"
#	include "SMLineFollower_FuncRefs.mm"
#	include "State_Finito_FuncRefs.mm"
#	include "State_Finito_Internal.mm"
}

