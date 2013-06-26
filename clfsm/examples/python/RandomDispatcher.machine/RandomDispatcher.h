//
// RandomDispatcher.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__RandomDispatcher__
#define __clfsm__RandomDispatcher__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class RandomDispatcher: public CLMachine
        {
            CLState *_states[3];
        public:
            RandomDispatcher(int mid=0, const char *name="RandomDispatcher");
            virtual ~RandomDispatcher();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "RandomDispatcher_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::RandomDispatcher *CLM_Create_RandomDispatcher(int mid,
        const char *name);
}

#endif // defined(__gufsm__RandomDispatcher__)
