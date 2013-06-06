//
// State_Classifier_result.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"
#include "State_Classifier_result.h"

#include "State_Classifier_result_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColor_Learner;
using namespace State;

Classifier_result::Classifier_result(const char *name): CLState(name, *new Classifier_result::OnEntry, *new Classifier_result::OnExit, *new Classifier_result::Internal)
{
}

Classifier_result::~Classifier_result()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Classifier_result::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Classifier_result_VarRefs.mm"
#	include "State_Classifier_result_OnEntry.mm"
}

void Classifier_result::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Classifier_result_VarRefs.mm"
#	include "State_Classifier_result_OnExit.mm"
}

void Classifier_result::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Color_Learner_VarRefs.mm"
#	include "State_Classifier_result_VarRefs.mm"
#	include "State_Classifier_result_Internal.mm"
}
