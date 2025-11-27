//
// State_Pong.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PingPongCLFSM_Includes.h"
#include "PingPongCLFSM.h"
#include "State_Pong.h"

#include "State_Pong_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMPingPongCLFSM;
using namespace State;

Pong::Pong(const char *name): CLState(name, *new Pong::OnEntry, *new Pong::OnExit, *new Pong::Internal, NULLPTR, new Pong::OnSuspend, new Pong::OnResume)
{
	_transitions[0] = new Transition_0();
}

Pong::~Pong()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void Pong::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"
#	include "State_Pong_OnEntry.mm"
}

void Pong::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"
#	include "State_Pong_OnExit.mm"
}

void Pong::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"
#	include "State_Pong_Internal.mm"
}

void Pong::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"
#	include "State_Pong_OnSuspend.mm"
}

void Pong::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"
#	include "State_Pong_OnResume.mm"
}

bool Pong::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Pong_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Pong_FuncRefs.mm"

	return
	(
#		include "State_Pong_Transition_0.expr"
	);
}
