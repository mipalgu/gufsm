//
// State_Main.mm -- 2013-05-02 08:32:26 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_Main.h"

#include "State_Main_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

Main::Main(const char *name): CLState(name, *new Main::OnEntry, *new Main::OnExit, *new Main::Internal)
{
	_transitions[0] = new Transition_0();
}

Main::~Main()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Main::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_OnEntry.mm"
}

void Main::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_OnExit.mm"
}

void Main::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Main_VarRefs.mm"
#	include "State_Main_Internal.mm"
}

bool Main::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_Main_VarRefs.mm"

	return
	(
#		include "State_Main_Transition_0.expr"
	);
}
