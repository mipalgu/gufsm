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

HeadSeek::HeadSeek(const char *name): CLState(name, *new HeadSeek::OnEntry, *new HeadSeek::OnExit, *new HeadSeek::Internal)
{
	_transitions[0] = new Transition_0();
}

HeadSeek::~HeadSeek()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HeadSeek::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_OnEntry.mm"
}

void HeadSeek::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_OnExit.mm"
}

void HeadSeek::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"
#	include "State_HeadSeek_Internal.mm"
}

bool HeadSeek::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSeeker_VarRefs.mm"
#	include "State_HeadSeek_VarRefs.mm"

	return
	(
#		include "State_HeadSeek_Transition_0.expr"
	);
}
