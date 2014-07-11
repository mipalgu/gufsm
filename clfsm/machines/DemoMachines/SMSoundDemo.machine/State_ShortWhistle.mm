//
// State_ShortWhistle.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMSoundDemo_Includes.h"
#include "SMSoundDemo.h"
#include "State_ShortWhistle.h"

#include "State_ShortWhistle_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMSoundDemo;
using namespace State;

ShortWhistle::ShortWhistle(const char *name): CLState(name, *new ShortWhistle::OnEntry, *new ShortWhistle::OnExit, *new ShortWhistle::Internal)
{
	_transitions[0] = new Transition_0();
}

ShortWhistle::~ShortWhistle()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void ShortWhistle::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_ShortWhistle_VarRefs.mm"
#	include "State_ShortWhistle_OnEntry.mm"
}

void ShortWhistle::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_ShortWhistle_VarRefs.mm"
#	include "State_ShortWhistle_OnExit.mm"
}

void ShortWhistle::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_ShortWhistle_VarRefs.mm"
#	include "State_ShortWhistle_Internal.mm"
}

bool ShortWhistle::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMSoundDemo_VarRefs.mm"
#	include "State_ShortWhistle_VarRefs.mm"

	return
	(
#		include "State_ShortWhistle_Transition_0.expr"
	);
}
