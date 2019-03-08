//
// TestOnSuspend.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_TestOnSuspend_
#define clfsm_machine_TestOnSuspend_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class TestOnSuspend: public CLMachine
        {
            CLState *_states[5];
        public:
            TestOnSuspend(int mid  = 0, const char *name = "TestOnSuspend");
            virtual ~TestOnSuspend();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "TestOnSuspend_Variables.h"
#           include "TestOnSuspend_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::TestOnSuspend *CLM_Create_TestOnSuspend(int mid, const char *name);
}

#endif // defined(clfsm_machine_TestOnSuspend_)
