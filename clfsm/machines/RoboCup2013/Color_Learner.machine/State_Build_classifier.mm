//
// State_Build_classifier.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Build_classifier.h"

#include "State_Build_classifier_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Build_classifier::Build_classifier(const char *name): CLState(name, *new Build_classifier::OnEntry, *new Build_classifier::OnExit, *new Build_classifier::Internal)
{
	_transitions[0] = new Transition_0();
}

Build_classifier::~Build_classifier()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Build_classifier::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Build_classifier_VarRefs.mm"
#	include "State_Build_classifier_OnEntry.mm"
}

void Build_classifier::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Build_classifier_VarRefs.mm"
#	include "State_Build_classifier_OnExit.mm"
}

void Build_classifier::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Build_classifier_VarRefs.mm"
#	include "State_Build_classifier_Internal.mm"
}

bool Build_classifier::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Build_classifier_VarRefs.mm"

	return
	(
#		include "State_Build_classifier_Transition_0.expr"
	);
}
