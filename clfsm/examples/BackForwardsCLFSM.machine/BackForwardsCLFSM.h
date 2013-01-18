//
// BackForwardsCLFSM.h -- 2013-01-18 00:32:40 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__BackForwardsCLFSM__
#define __clfsm__BackForwardsCLFSM__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class BackForwardsCLFSM: public CLMachine
        {
            CLState *_states[3];
        public:
            BackForwardsCLFSM(int mid  = 0, const char *name = "BackForwardsCLFSM");
            virtual ~BackForwardsCLFSM();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "BackForwardsCLFSM_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::BackForwardsCLFSM *CLM_Create_BackForwardsCLFSM(int mid, const char *name);
}

#endif // defined(__gufsm__BackForwardsCLFSM__)
