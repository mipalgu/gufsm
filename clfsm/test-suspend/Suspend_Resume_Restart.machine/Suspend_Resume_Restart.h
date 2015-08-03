//
// Suspend_Resume_Restart.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_Suspend_Resume_Restart_
#define clfsm_machine_Suspend_Resume_Restart_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Suspend_Resume_Restart: public CLMachine
        {
            CLState *_states[11];
        public:
            Suspend_Resume_Restart(int mid  = 0, const char *name = "Suspend_Resume_Restart");
            virtual ~Suspend_Resume_Restart();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 11; }
#           include "Suspend_Resume_Restart_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Suspend_Resume_Restart *CLM_Create_Suspend_Resume_Restart(int mid, const char *name);
}

#endif // defined(clfsm_machine_Suspend_Resume_Restart_)
