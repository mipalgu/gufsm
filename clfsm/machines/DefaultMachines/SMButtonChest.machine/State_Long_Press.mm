//
// State_Long_Press.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMButtonChest_Includes.h"
#include "SMButtonChest.h"
#include "State_Long_Press.h"

#include "State_Long_Press_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMButtonChest;
using namespace State;

Long_Press::Long_Press(const char *name): CLState(name, *new Long_Press::OnEntry, *new Long_Press::OnExit, *new Long_Press::Internal)
{
	_transitions[0] = new Transition_0();
}

Long_Press::~Long_Press()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Long_Press::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Long_Press_VarRefs.mm"
#	include "State_Long_Press_OnEntry.mm"
}

void Long_Press::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Long_Press_VarRefs.mm"
#	include "State_Long_Press_OnExit.mm"
}

void Long_Press::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Long_Press_VarRefs.mm"
#	include "State_Long_Press_Internal.mm"
}

bool Long_Press::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMButtonChest_VarRefs.mm"
#	include "State_Long_Press_VarRefs.mm"

	return
	(
#		include "State_Long_Press_Transition_0.expr"
	);
}
