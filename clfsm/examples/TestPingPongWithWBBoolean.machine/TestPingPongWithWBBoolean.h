//
// TestPingPongWithWBBoolean.h -- 2013-03-27 07:36:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__TestPingPongWithWBBoolean__
#define __clfsm__TestPingPongWithWBBoolean__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class TestPingPongWithWBBoolean: public CLMachine
        {
            CLState *_states[2];
        public:
            TestPingPongWithWBBoolean(int mid  = 0, const char *name = "TestPingPongWithWBBoolean");
            virtual ~TestPingPongWithWBBoolean();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "TestPingPongWithWBBoolean_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::TestPingPongWithWBBoolean *CLM_Create_TestPingPongWithWBBoolean(int mid, const char *name);
}

#endif // defined(__gufsm__TestPingPongWithWBBoolean__)
