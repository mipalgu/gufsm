//
// SMGoalApproach.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGoalApproach__
#define __clfsm__SMGoalApproach__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGoalApproach: public CLMachine
        {
            CLState *_states[6];
        public:
            SMGoalApproach(int mid  = 0, const char *name = "SMGoalApproach");
            virtual ~SMGoalApproach();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SMGoalApproach_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGoalApproach *CLM_Create_SMGoalApproach(int mid, const char *name);
}

#endif // defined(__gufsm__SMGoalApproach__)
