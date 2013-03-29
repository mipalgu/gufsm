//
// LEDsPingPong.h -- 2013-03-29 01:17:30 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__LEDsPingPong__
#define __clfsm__LEDsPingPong__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class LEDsPingPong: public CLMachine
        {
            CLState *_states[2];
        public:
            LEDsPingPong(int mid  = 0, const char *name = "LEDsPingPong");
            virtual ~LEDsPingPong();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "LEDsPingPong_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::LEDsPingPong *CLM_Create_LEDsPingPong(int mid, const char *name);
}

#endif // defined(__gufsm__LEDsPingPong__)
