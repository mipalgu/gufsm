//
// Schedule_Suspend.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_Schedule_Suspend_
#define clfsm_machine_Schedule_Suspend_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Schedule_Suspend: public CLMachine
        {
            CLState *_states[8];
        public:
            Schedule_Suspend(int mid  = 0, const char *name = "Schedule_Suspend");
            virtual ~Schedule_Suspend();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "Schedule_Suspend_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Schedule_Suspend *CLM_Create_Schedule_Suspend(int mid, const char *name);
}

#endif // defined(clfsm_machine_Schedule_Suspend_)
