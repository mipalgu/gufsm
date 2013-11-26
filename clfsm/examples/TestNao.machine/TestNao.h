//
// TestNao.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__TestNao__
#define __clfsm__TestNao__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class TestNao: public CLMachine
        {
            CLState *_states[2];
        public:
            TestNao(int mid  = 0, const char *name = "TestNao");
            virtual ~TestNao();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "TestNao_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::TestNao *CLM_Create_TestNao(int mid, const char *name);
}

#endif // defined(__gufsm__TestNao__)
