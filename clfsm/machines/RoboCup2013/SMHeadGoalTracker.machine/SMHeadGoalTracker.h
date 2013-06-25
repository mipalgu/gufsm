//
// SMHeadGoalTracker.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMHeadGoalTracker__
#define __clfsm__SMHeadGoalTracker__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMHeadGoalTracker: public CLMachine
        {
            CLState *_states[8];
        public:
            SMHeadGoalTracker(int mid  = 0, const char *name = "SMHeadGoalTracker");
            virtual ~SMHeadGoalTracker();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "SMHeadGoalTracker_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMHeadGoalTracker *CLM_Create_SMHeadGoalTracker(int mid, const char *name);
}

#endif // defined(__gufsm__SMHeadGoalTracker__)
