//
// SMOdometryTest.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SMOdometryTest_
#define clfsm_machine_SMOdometryTest_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMOdometryTest: public CLMachine
        {
            CLState *_states[4];
        public:
            SMOdometryTest(int mid  = 0, const char *name = "SMOdometryTest");
            virtual ~SMOdometryTest();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMOdometryTest_Variables.h"
#           include "SMOdometryTest_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMOdometryTest *CLM_Create_SMOdometryTest(int mid, const char *name);
}

#endif // defined(clfsm_machine_SMOdometryTest_)
