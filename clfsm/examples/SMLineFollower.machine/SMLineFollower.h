//
// SMLineFollower.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SMLineFollower_
#define clfsm_machine_SMLineFollower_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMLineFollower: public CLMachine
        {
            CLState *_states[4];
        public:
            SMLineFollower(int mid  = 0, const char *name = "SMLineFollower");
            virtual ~SMLineFollower();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMLineFollower_Variables.h"
#           include "SMLineFollower_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMLineFollower *CLM_Create_SMLineFollower(int mid, const char *name);
}

#endif // defined(clfsm_machine_SMLineFollower_)
