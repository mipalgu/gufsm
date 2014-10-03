//
// buttonNXT.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__buttonNXT__
#define __clfsm__buttonNXT__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class buttonNXT: public CLMachine
        {
            CLState *_states[3];
        public:
            buttonNXT(int mid  = 0, const char *name = "buttonNXT");
            virtual ~buttonNXT();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "buttonNXT_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::buttonNXT *CLM_Create_buttonNXT(int mid, const char *name);
}

#endif // defined(__gufsm__buttonNXT__)
