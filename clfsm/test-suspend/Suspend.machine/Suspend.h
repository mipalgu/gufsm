//
// Suspend.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__Suspend__
#define __clfsm__Suspend__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Suspend: public CLMachine
        {
            CLState *_states[7];
        public:
            Suspend(int mid  = 0, const char *name = "Suspend");
            virtual ~Suspend();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "Suspend_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Suspend *CLM_Create_Suspend(int mid, const char *name);
}

#endif // defined(__gufsm__Suspend__)
