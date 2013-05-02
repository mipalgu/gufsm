//
// State_DCM_ON.mm -- 2013-05-02 08:47:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMWalkScanner_Includes.h"
#include "SMWalkScanner.h"
#include "State_DCM_ON.h"

#include "State_DCM_ON_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMWalkScanner;
using namespace State;

DCM_ON::DCM_ON(const char *name): CLState(name, *new DCM_ON::OnEntry, *new DCM_ON::OnExit, *new DCM_ON::Internal)
{
	_transitions[0] = new Transition_0();
}

DCM_ON::~DCM_ON()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DCM_ON::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_OnEntry.mm"
}

void DCM_ON::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_OnExit.mm"
}

void DCM_ON::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"
#	include "State_DCM_ON_Internal.mm"
}

bool DCM_ON::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMWalkScanner_VarRefs.mm"
#	include "State_DCM_ON_VarRefs.mm"

	return
	(
#		include "State_DCM_ON_Transition_0.expr"
	);
}
