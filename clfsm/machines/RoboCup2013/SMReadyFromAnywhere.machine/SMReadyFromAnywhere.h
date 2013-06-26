//
// SMReadyFromAnywhere.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMReadyFromAnywhere__
#define __clfsm__SMReadyFromAnywhere__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMReadyFromAnywhere: public CLMachine
        {
            CLState *_states[9];
        public:
            SMReadyFromAnywhere(int mid  = 0, const char *name = "SMReadyFromAnywhere");
            virtual ~SMReadyFromAnywhere();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "SMReadyFromAnywhere_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMReadyFromAnywhere *CLM_Create_SMReadyFromAnywhere(int mid, const char *name);
}

#endif // defined(__gufsm__SMReadyFromAnywhere__)
