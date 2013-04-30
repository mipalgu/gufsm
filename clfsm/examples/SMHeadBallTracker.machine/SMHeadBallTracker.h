//
// SMHeadBallTracker.h -- 2013-04-26 07:35:02 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMHeadBallTracker__
#define __clfsm__SMHeadBallTracker__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMHeadBallTracker: public CLMachine
        {
            CLState *_states[4];
        public:
            SMHeadBallTracker(int mid  = 0, const char *name = "SMHeadBallTracker");
            virtual ~SMHeadBallTracker();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMHeadBallTracker_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMHeadBallTracker *CLM_Create_SMHeadBallTracker(int mid, const char *name);
}

#endif // defined(__gufsm__SMHeadBallTracker__)
