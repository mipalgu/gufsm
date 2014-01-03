//
// State_HeadSeek.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSeeker_Includes.h"
#include "SMSeeker.h"
#include "State_HeadSeek.h"

#include "State_HeadSeek_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSeeker;
using namespace State;

(null)::(null)(const char *name): CLState(name, *new (null)::OnEntry, *new (null)::OnExit, *new (null)::Internal)
{
	_transitions[0] = new Transition_0();
}

(null)::~(null)()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void (null)::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_OnEntry.mm"
}

void (null)::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_OnExit.mm"
}

void (null)::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_Internal.mm"
}

bool (null)::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"

	return
	(
#		include "State_HeadSeek_Transition_0.expr"
	);
}
