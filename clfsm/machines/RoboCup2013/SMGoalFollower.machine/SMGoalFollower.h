//
// SMGoalFollower.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGoalFollower__
#define __clfsm__SMGoalFollower__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGoalFollower: public CLMachine
        {
            CLState *_states[9];
        public:
            SMGoalFollower(int mid  = 0, const char *name = "SMGoalFollower");
            virtual ~SMGoalFollower();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "SMGoalFollower_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGoalFollower *CLM_Create_SMGoalFollower(int mid, const char *name);
}

#endif // defined(__gufsm__SMGoalFollower__)
