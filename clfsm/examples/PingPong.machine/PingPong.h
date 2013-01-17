//
// PingPong.h -- 2013-01-17 22:28:42 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__PingPong__
#define __clfsm__PingPong__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class PingPong: public CLMachine
        {
            CLState *_states[2];
        public:
            PingPong(int mid  = 0, const char *name = "PingPong");
            virtual ~PingPong();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "PingPong_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::PingPong *CLM_Create_PingPong(int mid, const char *name);
}

#endif // defined(__gufsm__PingPong__)
