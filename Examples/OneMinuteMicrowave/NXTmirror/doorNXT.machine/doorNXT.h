//
// doorNXT.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__doorNXT__
#define __clfsm__doorNXT__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class doorNXT: public CLMachine
        {
            CLState *_states[3];
        public:
            doorNXT(int mid  = 0, const char *name = "doorNXT");
            virtual ~doorNXT();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "doorNXT_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::doorNXT *CLM_Create_doorNXT(int mid, const char *name);
}

#endif // defined(__gufsm__doorNXT__)
