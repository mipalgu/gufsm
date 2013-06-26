//
// State_StopWalkAllTheWay.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_StopWalkAllTheWay.h"

#include "State_StopWalkAllTheWay_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

StopWalkAllTheWay::StopWalkAllTheWay(const char *name): CLState(name, *new StopWalkAllTheWay::OnEntry, *new StopWalkAllTheWay::OnExit, *new StopWalkAllTheWay::Internal)
{
}

StopWalkAllTheWay::~StopWalkAllTheWay()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void StopWalkAllTheWay::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StopWalkAllTheWay_VarRefs.mm"
#	include "State_StopWalkAllTheWay_OnEntry.mm"
}

void StopWalkAllTheWay::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StopWalkAllTheWay_VarRefs.mm"
#	include "State_StopWalkAllTheWay_OnExit.mm"
}

void StopWalkAllTheWay::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_StopWalkAllTheWay_VarRefs.mm"
#	include "State_StopWalkAllTheWay_Internal.mm"
}
