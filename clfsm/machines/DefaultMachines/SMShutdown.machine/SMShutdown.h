//
// SMShutdown.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMShutdown__
#define __clfsm__SMShutdown__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMShutdown: public CLMachine
        {
            CLState *_states[3];
        public:
            SMShutdown(int mid  = 0, const char *name = "SMShutdown");
            virtual ~SMShutdown();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "SMShutdown_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMShutdown *CLM_Create_SMShutdown(int mid, const char *name);
}

#endif // defined(__gufsm__SMShutdown__)
