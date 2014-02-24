//
//State_POST_BUTTON_PRESSED.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
#include "buttonNXT_Includes.h"
#include "buttonNXT.h"

#include "State_POST_BUTTON_PRESSED.h"
#include "State_POST_BUTTON_PRESSED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMbuttonNXT;
using namespace State;

POST_BUTTON_PRESSED::POST_BUTTON_PRESSED(const char *name):CLState(name, *new POST_BUTTON_PRESSED::OnEntry,*new POST_BUTTON_PRESSED::OnExit, *new POST_BUTTON_PRESSED::Internal)
{

}

POST_BUTTON_PRESSED::~POST_BUTTON_PRESSED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void POST_BUTTON_PRESSED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_OnEntry.mm"
}

void POST_BUTTON_PRESSED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_OnExit.mm"
}

void POST_BUTTON_PRESSED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "buttonNXT_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_VarRefs.mm"
#	include "State_POST_BUTTON_PRESSED_Internal.mm"
}



