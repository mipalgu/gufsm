//
// TestOnResume.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_TestOnResume_
#define clfsm_machine_TestOnResume_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class TestOnResume: public CLMachine
        {
            CLState *_states[7];
        public:
            TestOnResume(int mid  = 0, const char *name = "TestOnResume");
            virtual ~TestOnResume();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "TestOnResume_Variables.h"
#           include "TestOnResume_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::TestOnResume *CLM_Create_TestOnResume(int mid, const char *name);
}

#endif // defined(clfsm_machine_TestOnResume_)
