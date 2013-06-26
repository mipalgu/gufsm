//
// State_One.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "RandomDispatcher_Includes.h"
#include "RandomDispatcher.h"
#include "State_One.h"

#include "State_One_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMRandomDispatcher;
using namespace State;

One::One(const char *name): CLState(name, *new One::OnEntry,
    *new One::OnExit, *new One::Internal) {
        _transitions[0] = new Transition_0();
        _transitions[1] = new Transition_1();

}

One::~One()
{
    delete &onEntryAction();
    delete &onExitAction();
    delete &internalAction();

    delete _transitions[0];
}

void One::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "State_One_OnEntry.mm"
}

void One::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "State_One_OnExit.mm"
}

void One::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "State_One_Internal.mm"
}


bool One::Transition_0::check(CLMachine *_machine,
    CLState *_state) const {
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_One_VarRefs.mm"

    return
    (
#		include "State_One_Transition_0.expr"
    );
}

bool One::Transition_1::check(CLMachine *_machine,
    CLState *_state) const {
#	include "RandomDispatcher_VarRefs.mm"
#	include "State_One_VarRefs.mm"

    return
    (
#		include "State_One_Transition_1.expr"
    );
}

