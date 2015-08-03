//
// Suspend.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_
#define clfsm_Suspend_

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

#endif // defined(clfsm_Suspend_)
