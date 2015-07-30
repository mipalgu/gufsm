//
// MultiMachine.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__MultiMachine__
#define __clfsm__MultiMachine__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class MultiMachine: public CLMachine
        {
            CLState *_states[5];
        public:
            MultiMachine(int mid  = 0, const char *name = "MultiMachine");
            virtual ~MultiMachine();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "MultiMachine_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::MultiMachine *CLM_Create_MultiMachine(int mid, const char *name);
}

#endif // defined(__gufsm__MultiMachine__)
