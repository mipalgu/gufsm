//
// State_Three.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "RandomDispatcher_Includes.h"
#include "RandomDispatcher.h"
#include "State_Three.h"

#include "State_Three_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMRandomDispatcher;
using namespace State;

Three::Three(const char *name): CLState(name, *new Three::OnEntry,
    *new Three::OnExit, *new Three::Internal) {
        _transitions[0] = new Transition_0();

}

Three::~Three()
{
    delete &onEntryAction();
    delete &onExitAction();
    delete &internalAction();

    delete _transitions[0];
}

void Three::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "State_Three_OnEntry.mm"
}

void Three::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "State_Three_OnExit.mm"
}

void Three::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "State_Three_Internal.mm"
}


bool Three::Transition_0::check(CLMachine *_machine,
    CLState *_state) const {
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_Three_VarRefs.mm"

    return
    (
#		include "State_Three_Transition_0.expr"
    );
}

