//
// SMPlayer1.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMPlayer1__
#define __clfsm__SMPlayer1__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMPlayer1: public CLMachine
        {
            CLState *_states[5];
        public:
            SMPlayer1(int mid  = 0, const char *name = "SMPlayer1");
            virtual ~SMPlayer1();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMPlayer1_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMPlayer1 *CLM_Create_SMPlayer1(int mid, const char *name);
}

#endif // defined(__gufsm__SMPlayer1__)
