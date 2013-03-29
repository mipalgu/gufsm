//
// State_Ping.mm -- 2013-03-27 07:36:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "TestPingPongWithWBBoolean_Includes.h"
#include "TestPingPongWithWBBoolean.h"
#include "State_Ping.h"

#include "State_Ping_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace State;

Ping::Ping(const char *name): CLState(name, *new Ping::OnEntry, *new Ping::OnExit, *new Ping::Internal)
{
	_transitions[0] = new Transition_0();
}

Ping::~Ping()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Ping::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestPingPongWithWBBoolean_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_OnEntry.mm"
}

void Ping::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestPingPongWithWBBoolean_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_OnExit.mm"
}

void Ping::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "TestPingPongWithWBBoolean_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_Internal.mm"
}

bool Ping::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "TestPingPongWithWBBoolean_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"

	return
	(
#		include "State_Ping_Transition_0.expr"
	);
}
