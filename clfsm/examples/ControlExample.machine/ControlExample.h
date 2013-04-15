//
// ControlExample.h -- 2013-04-15 04:08:33 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__ControlExample__
#define __clfsm__ControlExample__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class ControlExample: public CLMachine
        {
            CLState *_states[8];
        public:
            ControlExample(int mid  = 0, const char *name = "ControlExample");
            virtual ~ControlExample();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "ControlExample_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::ControlExample *CLM_Create_ControlExample(int mid, const char *name);
}

#endif // defined(__gufsm__ControlExample__)
