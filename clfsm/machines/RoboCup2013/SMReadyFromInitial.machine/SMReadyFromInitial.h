//
// SMReadyFromInitial.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMReadyFromInitial__
#define __clfsm__SMReadyFromInitial__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMReadyFromInitial: public CLMachine
        {
            CLState *_states[19];
        public:
            SMReadyFromInitial(int mid  = 0, const char *name = "SMReadyFromInitial");
            virtual ~SMReadyFromInitial();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 19; }
#           include "SMReadyFromInitial_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMReadyFromInitial *CLM_Create_SMReadyFromInitial(int mid, const char *name);
}

#endif // defined(__gufsm__SMReadyFromInitial__)
