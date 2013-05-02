//
// SMBallFollower.h -- 2013-05-02 08:33:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMBallFollower__
#define __clfsm__SMBallFollower__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMBallFollower: public CLMachine
        {
            CLState *_states[12];
        public:
            SMBallFollower(int mid  = 0, const char *name = "SMBallFollower");
            virtual ~SMBallFollower();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 12; }
#           include "SMBallFollower_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMBallFollower *CLM_Create_SMBallFollower(int mid, const char *name);
}

#endif // defined(__gufsm__SMBallFollower__)
