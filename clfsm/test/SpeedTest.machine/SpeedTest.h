//
// SpeedTest.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_SpeedTest
#define clfsm_SpeedTest

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SpeedTest: public CLMachine
        {
            CLState *_states[3];
        public:
            SpeedTest(int mid  = 0, const char *name = "SpeedTest");
            virtual ~SpeedTest();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "SpeedTest_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SpeedTest *CLM_Create_SpeedTest(int mid, const char *name);
}

#endif // defined(clfm_SpeedTest)
