//
// Suspend_is_Accepting.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__Suspend_is_Accepting__
#define __clfsm__Suspend_is_Accepting__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Suspend_is_Accepting: public CLMachine
        {
            CLState *_states[6];
        public:
            Suspend_is_Accepting(int mid  = 0, const char *name = "Suspend_is_Accepting");
            virtual ~Suspend_is_Accepting();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "Suspend_is_Accepting_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Suspend_is_Accepting *CLM_Create_Suspend_is_Accepting(int mid, const char *name);
}

#endif // defined(__gufsm__Suspend_is_Accepting__)
