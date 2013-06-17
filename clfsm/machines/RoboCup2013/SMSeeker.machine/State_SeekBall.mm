//
// State_SeekBall.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_SeekBall.h"

#include "State_SeekBall_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

SeekBall::SeekBall(const char *name): CLState(name, *new SeekBall::OnEntry, *new SeekBall::OnExit, *new SeekBall::Internal)
{
}

SeekBall::~SeekBall()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SeekBall::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_OnEntry.mm"
}

void SeekBall::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_OnExit.mm"
}

void SeekBall::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_SeekBall_VarRefs.mm"
#	include "State_SeekBall_Internal.mm"
}
