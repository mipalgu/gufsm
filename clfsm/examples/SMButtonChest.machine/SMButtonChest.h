//
// SMButtonChest.h -- 2013-04-15 06:29:07 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMButtonChest__
#define __clfsm__SMButtonChest__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMButtonChest: public CLMachine
        {
            CLState *_states[4];
        public:
            SMButtonChest(int mid  = 0, const char *name = "SMButtonChest");
            virtual ~SMButtonChest();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMButtonChest_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMButtonChest *CLM_Create_SMButtonChest(int mid, const char *name);
}

#endif // defined(__gufsm__SMButtonChest__)
