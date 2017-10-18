//
// SLAM.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SLAM_
#define clfsm_machine_SLAM_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SLAM: public CLMachine
        {
            CLState *_states[23];
        public:
            SLAM(int mid  = 0, const char *name = "SLAM");
            virtual ~SLAM();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 23; }
#           include "SLAM_Variables.h"
#           include "SLAM_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SLAM *CLM_Create_SLAM(int mid, const char *name);
}

#endif // defined(clfsm_machine_SLAM_)
