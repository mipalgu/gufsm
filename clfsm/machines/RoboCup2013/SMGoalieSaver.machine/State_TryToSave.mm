//
// State_TryToSave.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_TryToSave.h"

#include "State_TryToSave_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

TryToSave::TryToSave(const char *name): CLState(name, *new TryToSave::OnEntry, *new TryToSave::OnExit, *new TryToSave::Internal)
{
}

TryToSave::~TryToSave()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void TryToSave::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_OnEntry.mm"
}

void TryToSave::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_OnExit.mm"
}

void TryToSave::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_TryToSave_VarRefs.mm"
#	include "State_TryToSave_Internal.mm"
}
