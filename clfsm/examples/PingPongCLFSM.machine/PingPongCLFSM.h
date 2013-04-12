//
// PingPongCLFSM.h -- 2013-04-12 20:59:24 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__PingPongCLFSM__
#define __clfsm__PingPongCLFSM__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class PingPongCLFSM: public CLMachine
        {
            CLState *_states[2];
        public:
            PingPongCLFSM(int mid  = 0, const char *name = "PingPongCLFSM");
            virtual ~PingPongCLFSM();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "PingPongCLFSM_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::PingPongCLFSM *CLM_Create_PingPongCLFSM(int mid, const char *name);
}

#endif // defined(__gufsm__PingPongCLFSM__)
