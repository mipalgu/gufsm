//
// SMGoalieSaver.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SMGoalieSaver_Includes.h"
#include "SMGoalieSaver.h"

#include "State_Initial.h"
#include "State_Check.h"
#include "State_Delay.h"
#include "State_TryToSave.h"
#include "State_SUSPENDED.h"
#include "State_SaveLeft.h"
#include "State_SaveRight.h"
#include "State_Waiting.h"
#include "State_SaveFinished.h"
#include "State_HoldPos.h"
#include "State_StartKneel.h"
#include "State_Stabalize.h"
#include "State_FoundConstDir.h"
#include "State_StartFaceGoal.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SMGoalieSaver *CLM_Create_SMGoalieSaver(int mid, const char *name)
	{
		return new SMGoalieSaver(mid, name);
	}
}

SMGoalieSaver::SMGoalieSaver(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSMGoalieSaver::State::Initial;
	_states[1] = new FSMSMGoalieSaver::State::Check;
	_states[2] = new FSMSMGoalieSaver::State::Delay;
	_states[3] = new FSMSMGoalieSaver::State::TryToSave;
	_states[4] = new FSMSMGoalieSaver::State::SUSPENDED;
	_states[5] = new FSMSMGoalieSaver::State::SaveLeft;
	_states[6] = new FSMSMGoalieSaver::State::SaveRight;
	_states[7] = new FSMSMGoalieSaver::State::Waiting;
	_states[8] = new FSMSMGoalieSaver::State::SaveFinished;
	_states[9] = new FSMSMGoalieSaver::State::HoldPos;
	_states[10] = new FSMSMGoalieSaver::State::StartKneel;
	_states[11] = new FSMSMGoalieSaver::State::Stabalize;
	_states[12] = new FSMSMGoalieSaver::State::FoundConstDir;
	_states[13] = new FSMSMGoalieSaver::State::StartFaceGoal;

	setSuspendState(_states[4]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SMGoalieSaver::~SMGoalieSaver()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
	delete _states[11];
	delete _states[12];
	delete _states[13];
}