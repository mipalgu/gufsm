//
// SMKicker3.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMKicker3__
#define __clfsm__SMKicker3__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMKicker3: public CLMachine
        {
            CLState *_states[6];
        public:
            SMKicker3(int mid  = 0, const char *name = "SMKicker3");
            virtual ~SMKicker3();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SMKicker3_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMKicker3 *CLM_Create_SMKicker3(int mid, const char *name);
}

#endif // defined(__gufsm__SMKicker3__)
