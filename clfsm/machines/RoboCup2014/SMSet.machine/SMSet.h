//
// SMSet.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSet__
#define __clfsm__SMSet__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSet: public CLMachine
        {
            CLState *_states[6];
        public:
            SMSet(int mid  = 0, const char *name = "SMSet");
            virtual ~SMSet();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SMSet_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSet *CLM_Create_SMSet(int mid, const char *name);
}

#endif // defined(__gufsm__SMSet__)
