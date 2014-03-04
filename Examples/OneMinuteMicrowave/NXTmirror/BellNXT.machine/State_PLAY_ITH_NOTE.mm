//
//State_PLAY_ITH_NOTE.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "BellNXT_Includes.h"
#include "BellNXT.h"

#include "State_PLAY_ITH_NOTE.h"
#include "State_PLAY_ITH_NOTE_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBellNXT;
using namespace State;

PLAY_ITH_NOTE::PLAY_ITH_NOTE(const char *name):CLState(name, *new PLAY_ITH_NOTE::OnEntry,*new PLAY_ITH_NOTE::OnExit, *new PLAY_ITH_NOTE::Internal)
{
	_transitions[0] = new Transition_0();
}

PLAY_ITH_NOTE::~PLAY_ITH_NOTE()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void PLAY_ITH_NOTE::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_OnEntry.mm"
}

void PLAY_ITH_NOTE::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_OnExit.mm"
}

void PLAY_ITH_NOTE::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_Internal.mm"
}

bool PLAY_ITH_NOTE::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BellNXT_VarRefs.mm"
#	include "State_PLAY_ITH_NOTE_VarRefs.mm"

	return
	(
#			include "State_PLAY_ITH_NOTE_Transition_0.expr"
	);
}


