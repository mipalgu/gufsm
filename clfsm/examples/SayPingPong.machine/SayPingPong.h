//
// SayPingPong.h -- 2013-04-15 04:13:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SayPingPong__
#define __clfsm__SayPingPong__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SayPingPong: public CLMachine
        {
            CLState *_states[2];
        public:
            SayPingPong(int mid  = 0, const char *name = "SayPingPong");
            virtual ~SayPingPong();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "SayPingPong_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SayPingPong *CLM_Create_SayPingPong(int mid, const char *name);
}

#endif // defined(__gufsm__SayPingPong__)
