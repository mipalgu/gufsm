//
// SMGetUp.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGetUp__
#define __clfsm__SMGetUp__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGetUp: public CLMachine
        {
            CLState *_states[5];
        public:
            SMGetUp(int mid  = 0, const char *name = "SMGetUp");
            virtual ~SMGetUp();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMGetUp_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGetUp *CLM_Create_SMGetUp(int mid, const char *name);
}

#endif // defined(__gufsm__SMGetUp__)
