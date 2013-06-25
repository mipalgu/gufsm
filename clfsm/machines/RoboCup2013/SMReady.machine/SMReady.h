//
// SMReady.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMReady__
#define __clfsm__SMReady__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMReady: public CLMachine
        {
            CLState *_states[18];
        public:
            SMReady(int mid  = 0, const char *name = "SMReady");
            virtual ~SMReady();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 18; }
#           include "SMReady_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMReady *CLM_Create_SMReady(int mid, const char *name);
}

#endif // defined(__gufsm__SMReady__)
