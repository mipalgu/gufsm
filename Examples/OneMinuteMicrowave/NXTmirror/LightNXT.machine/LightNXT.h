//
// LightNXT.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__LightNXT__
#define __clfsm__LightNXT__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class LightNXT: public CLMachine
        {
            CLState *_states[3];
        public:
            LightNXT(int mid  = 0, const char *name = "LightNXT");
            virtual ~LightNXT();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "LightNXT_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::LightNXT *CLM_Create_LightNXT(int mid, const char *name);
}

#endif // defined(__gufsm__LightNXT__)
