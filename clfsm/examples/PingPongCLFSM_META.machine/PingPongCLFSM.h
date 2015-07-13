//
// PingPongCLFSM.h
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
        class PingPongCLFSM_META: public CLMachine
        {
            CLState *_states[2];
        public:
            PingPongCLFSM_META(int mid  = 0, const char *name = "PingPongCLFSM_META");
            virtual ~PingPongCLFSM_META();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "PingPongCLFSM_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::PingPongCLFSM_META *CLM_Create_PingPongCLFSM_META(int mid, const char *name);
}

#endif // defined(__gufsm__PingPongCLFSM__)
