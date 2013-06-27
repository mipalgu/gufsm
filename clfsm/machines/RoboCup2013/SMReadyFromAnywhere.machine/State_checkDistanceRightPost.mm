//
// State_checkDistanceRightPost.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMReadyFromAnywhere_Includes.h"
#include "SMReadyFromAnywhere.h"
#include "State_checkDistanceRightPost.h"

#include "State_checkDistanceRightPost_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSMReadyFromAnywhere;
using namespace State;

checkDistanceRightPost::checkDistanceRightPost(const char *name): CLState(name, *new checkDistanceRightPost::OnEntry, *new checkDistanceRightPost::OnExit, *new checkDistanceRightPost::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

checkDistanceRightPost::~checkDistanceRightPost()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void checkDistanceRightPost::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistanceRightPost_VarRefs.mm"
#	include "State_checkDistanceRightPost_OnEntry.mm"
}

void checkDistanceRightPost::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistanceRightPost_VarRefs.mm"
#	include "State_checkDistanceRightPost_OnExit.mm"
}

void checkDistanceRightPost::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistanceRightPost_VarRefs.mm"
#	include "State_checkDistanceRightPost_Internal.mm"
}

bool checkDistanceRightPost::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistanceRightPost_VarRefs.mm"

	return
	(
#		include "State_checkDistanceRightPost_Transition_0.expr"
	);
}

bool checkDistanceRightPost::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SMReadyFromAnywhere_VarRefs.mm"
#	include "State_checkDistanceRightPost_VarRefs.mm"

	return
	(
#		include "State_checkDistanceRightPost_Transition_1.expr"
	);
}
