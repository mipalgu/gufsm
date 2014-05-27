//
// SMButtonLeftFoot.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMButtonLeftFoot__
#define __clfsm__SMButtonLeftFoot__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMButtonLeftFoot: public CLMachine
        {
            CLState *_states[5];
        public:
            SMButtonLeftFoot(int mid  = 0, const char *name = "SMButtonLeftFoot");
            virtual ~SMButtonLeftFoot();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMButtonLeftFoot_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMButtonLeftFoot *CLM_Create_SMButtonLeftFoot(int mid, const char *name);
}

#endif // defined(__gufsm__SMButtonLeftFoot__)