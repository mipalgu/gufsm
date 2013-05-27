//
// State_Start_GC.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "StateMachineStarter_Includes.h"
#include "StateMachineStarter.h"
#include "State_Start_GC.h"

#include "State_Start_GC_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMStateMachineStarter;
using namespace State;

Start_GC::Start_GC(const char *name): CLState(name, *new Start_GC::OnEntry, *new Start_GC::OnExit, *new Start_GC::Internal)
{
	_transitions[0] = new Transition_0();
}

Start_GC::~Start_GC()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Start_GC::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_GC_VarRefs.mm"
#	include "State_Start_GC_OnEntry.mm"
}

void Start_GC::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_GC_VarRefs.mm"
#	include "State_Start_GC_OnExit.mm"
}

void Start_GC::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_GC_VarRefs.mm"
#	include "State_Start_GC_Internal.mm"
}

bool Start_GC::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "StateMachineStarter_VarRefs.mm"
#	include "State_Start_GC_VarRefs.mm"

	return
	(
#		include "State_Start_GC_Transition_0.expr"
	);
}