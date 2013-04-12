//
// StateMachineStarter.h -- 2013-04-12 03:22:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__StateMachineStarter__
#define __clfsm__StateMachineStarter__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class StateMachineStarter: public CLMachine
        {
            CLState *_states[5];
        public:
            StateMachineStarter(int mid  = 0, const char *name = "StateMachineStarter");
            virtual ~StateMachineStarter();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "StateMachineStarter_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::StateMachineStarter *CLM_Create_StateMachineStarter(int mid, const char *name);
}

#endif // defined(__gufsm__StateMachineStarter__)