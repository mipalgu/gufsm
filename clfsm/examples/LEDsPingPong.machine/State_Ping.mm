//
// State_Ping.mm -- 2013-04-15 04:17:44 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LEDsPingPong_Includes.h"
#include "LEDsPingPong.h"
#include "State_Ping.h"

#include "State_Ping_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLEDsPingPong;
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
#	include "LEDsPingPong_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_OnEntry.mm"
}

void Ping::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LEDsPingPong_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_OnExit.mm"
}

void Ping::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LEDsPingPong_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"
#	include "State_Ping_Internal.mm"
}

bool Ping::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LEDsPingPong_VarRefs.mm"
#	include "State_Ping_VarRefs.mm"

	return
	(
#		include "State_Ping_Transition_0.expr"
	);
}
