//
// State_DCMPose.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"
#include "State_DCMPose.h"

#include "State_DCMPose_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMGoalieSaver;
using namespace State;

DCMPose::DCMPose(const char *name): CLState(name, *new DCMPose::OnEntry, *new DCMPose::OnExit, *new DCMPose::Internal)
{
	_transitions[0] = new Transition_0();
}

DCMPose::~DCMPose()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void DCMPose::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_DCMPose_VarRefs.mm"
#	include "State_DCMPose_OnEntry.mm"
}

void DCMPose::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_DCMPose_VarRefs.mm"
#	include "State_DCMPose_OnExit.mm"
}

void DCMPose::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_DCMPose_VarRefs.mm"
#	include "State_DCMPose_Internal.mm"
}

bool DCMPose::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMGoalieSaver_VarRefs.mm"
#	include "State_DCMPose_VarRefs.mm"

	return
	(
#		include "State_DCMPose_Transition_0.expr"
	);
}
