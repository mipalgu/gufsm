//
// State_Do_Mid_Scan.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMHeadScanner_Includes.h"
#include "SMHeadScanner.h"
#include "State_Do_Mid_Scan.h"

#include "State_Do_Mid_Scan_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMHeadScanner;
using namespace State;

Do_Mid_Scan::Do_Mid_Scan(const char *name): CLState(name, *new Do_Mid_Scan::OnEntry, *new Do_Mid_Scan::OnExit, *new Do_Mid_Scan::Internal)
{
	_transitions[0] = new Transition_0();
}

Do_Mid_Scan::~Do_Mid_Scan()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Do_Mid_Scan::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Mid_Scan_VarRefs.mm"
#	include "State_Do_Mid_Scan_OnEntry.mm"
}

void Do_Mid_Scan::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Mid_Scan_VarRefs.mm"
#	include "State_Do_Mid_Scan_OnExit.mm"
}

void Do_Mid_Scan::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Mid_Scan_VarRefs.mm"
#	include "State_Do_Mid_Scan_Internal.mm"
}

bool Do_Mid_Scan::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMHeadScanner_VarRefs.mm"
#	include "State_Do_Mid_Scan_VarRefs.mm"

	return
	(
#		include "State_Do_Mid_Scan_Transition_0.expr"
	);
}