//
// State_Shutdown.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMShutdown_Includes.h"
#include "SMShutdown.h"
#include "State_Shutdown.h"

#include "State_Shutdown_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMShutdown;
using namespace State;

Shutdown::Shutdown(const char *name): CLState(name, *new Shutdown::OnEntry, *new Shutdown::OnExit, *new Shutdown::Internal)
{
	_transitions[0] = new Transition_0();
}

Shutdown::~Shutdown()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Shutdown::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMShutdown_VarRefs.mm"
#	include "State_Shutdown_VarRefs.mm"
#	include "State_Shutdown_OnEntry.mm"
}

void Shutdown::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMShutdown_VarRefs.mm"
#	include "State_Shutdown_VarRefs.mm"
#	include "State_Shutdown_OnExit.mm"
}

void Shutdown::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMShutdown_VarRefs.mm"
#	include "State_Shutdown_VarRefs.mm"
#	include "State_Shutdown_Internal.mm"
}

bool Shutdown::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMShutdown_VarRefs.mm"
#	include "State_Shutdown_VarRefs.mm"

	return
	(
#		include "State_Shutdown_Transition_0.expr"
	);
}
