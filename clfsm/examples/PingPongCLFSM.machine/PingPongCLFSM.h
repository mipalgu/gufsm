//
// PingPongCLFSM.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_PingPongCLFSM_
#define clfsm_machine_PingPongCLFSM_

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
#           include "PingPongCLFSM_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::PingPongCLFSM *CLM_Create_PingPongCLFSM(int mid, const char *name);
}

#endif // defined(clfsm_machine_PingPongCLFSM_)
