//
// GetUp.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__GetUp__
#define __clfsm__GetUp__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class GetUp: public CLMachine
        {
            CLState *_states[5];
        public:
            GetUp(int mid  = 0, const char *name = "GetUp");
            virtual ~GetUp();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "GetUp_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::GetUp *CLM_Create_GetUp(int mid, const char *name);
}

#endif // defined(__gufsm__GetUp__)
