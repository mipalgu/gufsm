//
// State_Extra_Time.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundWhistle_Includes.h"
#include "SMSoundWhistle.h"
#include "State_Extra_Time.h"

#include "State_Extra_Time_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundWhistle;
using namespace State;

Extra_Time::Extra_Time(const char *name): CLState(name, *new Extra_Time::OnEntry, *new Extra_Time::OnExit, *new Extra_Time::Internal)
{
	_transitions[0] = new Transition_0();
}

Extra_Time::~Extra_Time()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Extra_Time::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Extra_Time_VarRefs.mm"
#	include "State_Extra_Time_OnEntry.mm"
}

void Extra_Time::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Extra_Time_VarRefs.mm"
#	include "State_Extra_Time_OnExit.mm"
}

void Extra_Time::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Extra_Time_VarRefs.mm"
#	include "State_Extra_Time_Internal.mm"
}

bool Extra_Time::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundWhistle_VarRefs.mm"
#	include "State_Extra_Time_VarRefs.mm"

	return
	(
#		include "State_Extra_Time_Transition_0.expr"
	);
}
