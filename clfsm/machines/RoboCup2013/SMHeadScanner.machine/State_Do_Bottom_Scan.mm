//
// State_Do_Bottom_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_Do_Bottom_Scan.h"

#include "State_Do_Bottom_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScanner;
using namespace State;

Do_Bottom_Scan::Do_Bottom_Scan(const char *name): CLState(name, *new Do_Bottom_Scan::OnEntry, *new Do_Bottom_Scan::OnExit, *new Do_Bottom_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Do_Bottom_Scan::~Do_Bottom_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Do_Bottom_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Bottom_Scan_VarRefs.mm"
#	include "State_Do_Bottom_Scan_OnEntry.mm"
}

void Do_Bottom_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Bottom_Scan_VarRefs.mm"
#	include "State_Do_Bottom_Scan_OnExit.mm"
}

void Do_Bottom_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Bottom_Scan_VarRefs.mm"
#	include "State_Do_Bottom_Scan_Internal.mm"
}

bool Do_Bottom_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Bottom_Scan_VarRefs.mm"

	return
	(
#		include "State_Do_Bottom_Scan_Transition_0.expr"
	);
}