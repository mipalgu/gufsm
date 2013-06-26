//
// RandomDispatcher.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "RandomDispatcher_Includes.h"
#include "RandomDispatcher.h"

#include "State_One.h"
#include "State_Two.h"
#include "State_Three.h"


using namespace FSM;
using namespace CLM;

extern "C"
{
        RandomDispatcher *CLM_Create_RandomDispatcher(int mid,
            const char *name)
        {
                return new RandomDispatcher(mid, name);
        }
}

RandomDispatcher::RandomDispatcher(int mid, const char *name): CLMachine(mid,
    name) {
        _states[0] = new FSMRandomDispatcher::State::One;
        _states[1] = new FSMRandomDispatcher::State::Two;
        _states[2] = new FSMRandomDispatcher::State::Three;

        setInitialState(_states[0]);            // set initial state
}

RandomDispatcher::~RandomDispatcher()
{
        _delete states[0];
        _delete states[1];
        _delete states[2];

}
