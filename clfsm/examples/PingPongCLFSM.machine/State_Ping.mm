//
// State_Ping.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "PingPongCLFSM_Includes.h"
#include "PingPongCLFSM.h"
#include "State_Ping.h"

#include "State_Ping_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMPingPongCLFSM;
using namespace State;

Ping::Ping(const char *name): CLState(name, *new Ping::OnEntry, *new Ping::OnExit, *new Ping::Internal, NULLPTR, new Ping::OnSuspend, new Ping::OnResume)
{
	_transitions[0] = new Transition_0();
}

Ping::~Ping()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void Ping::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"
#	include "State_Ping_OnEntry.mm"
}

void Ping::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"
#	include "State_Ping_OnExit.mm"
}

void Ping::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"
#	include "State_Ping_Internal.mm"
}

void Ping::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"
#	include "State_Ping_OnSuspend.mm"
}

void Ping::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"
#	include "State_Ping_OnResume.mm"
}

bool Ping::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "PingPongCLFSM_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "PingPongCLFSM_FuncRefs.mm"
#	include "State_Ping_FuncRefs.mm"

	return
	(
#		include "State_Ping_Transition_0.expr"
	);
}
