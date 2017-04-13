//
// FunctionsTest.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_FunctionsTest_
#define clfsm_machine_FunctionsTest_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class FunctionsTest: public CLMachine
        {
            CLState *_states[2];
        public:
            FunctionsTest(int mid  = 0, const char *name = "FunctionsTest");
            virtual ~FunctionsTest();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "FunctionsTest_Variables.h"
#           include "FunctionsTest_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::FunctionsTest *CLM_Create_FunctionsTest(int mid, const char *name);
}

#endif // defined(clfsm_machine_FunctionsTest_)
