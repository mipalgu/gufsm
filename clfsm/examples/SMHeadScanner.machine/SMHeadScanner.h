//
// SMHeadScanner.h -- 2013-04-26 03:55:22 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMHeadScanner__
#define __clfsm__SMHeadScanner__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMHeadScanner: public CLMachine
        {
            CLState *_states[11];
        public:
            SMHeadScanner(int mid  = 0, const char *name = "SMHeadScanner");
            virtual ~SMHeadScanner();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 11; }
#           include "SMHeadScanner_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMHeadScanner *CLM_Create_SMHeadScanner(int mid, const char *name);
}

#endif // defined(__gufsm__SMHeadScanner__)
