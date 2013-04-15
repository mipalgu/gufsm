//
// SMButtonRightFoot.h -- 2013-04-15 05:00:03 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMButtonRightFoot__
#define __clfsm__SMButtonRightFoot__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMButtonRightFoot: public CLMachine
        {
            CLState *_states[4];
        public:
            SMButtonRightFoot(int mid  = 0, const char *name = "SMButtonRightFoot");
            virtual ~SMButtonRightFoot();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMButtonRightFoot_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMButtonRightFoot *CLM_Create_SMButtonRightFoot(int mid, const char *name);
}

#endif // defined(__gufsm__SMButtonRightFoot__)
