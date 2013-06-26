//
// Color_Learner.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "Color_Learner_Includes.h"
#include "Color_Learner.h"

#include "State_Init.h"
#include "State_First_motion.h"
#include "State_First_shot.h"
#include "State_First_head.h"
#include "State_Second_head.h"
#include "State_Second_shot.h"
#include "State_Build_classifier.h"
#include "State_Classifier_result.h"
#include "State_Third_head.h"
#include "State_Third_shot.h"
#include "State_SUSPENDED.h"
#include "State_First_empty.h"
#include "State_Second_empty.h"
#include "State_Third_empty.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	Color_Learner *CLM_Create_Color_Learner(int mid, const char *name)
	{
		return new Color_Learner(mid, name);
	}
}

Color_Learner::Color_Learner(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMColor_Learner::State::Init;
	_states[1] = new FSMColor_Learner::State::First_motion;
	_states[2] = new FSMColor_Learner::State::First_shot;
	_states[3] = new FSMColor_Learner::State::First_head;
	_states[4] = new FSMColor_Learner::State::Second_head;
	_states[5] = new FSMColor_Learner::State::Second_shot;
	_states[6] = new FSMColor_Learner::State::Build_classifier;
	_states[7] = new FSMColor_Learner::State::Classifier_result;
	_states[8] = new FSMColor_Learner::State::Third_head;
	_states[9] = new FSMColor_Learner::State::Third_shot;
	_states[10] = new FSMColor_Learner::State::SUSPENDED;
	_states[11] = new FSMColor_Learner::State::First_empty;
	_states[12] = new FSMColor_Learner::State::Second_empty;
	_states[13] = new FSMColor_Learner::State::Third_empty;

	setSuspendState(_states[10]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

Color_Learner::~Color_Learner()
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
