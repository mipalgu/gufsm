//
// AddMachineTest.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__AddMachineTest__
#define __clfsm__AddMachineTest__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class AddMachineTest: public CLMachine
        {
            CLState *_states[4];
        public:
            AddMachineTest(int mid  = 0, const char *name = "AddMachineTest");
            virtual ~AddMachineTest();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "AddMachineTest_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::AddMachineTest *CLM_Create_AddMachineTest(int mid, const char *name);
}

#endif // defined(__gufsm__AddMachineTest__)
