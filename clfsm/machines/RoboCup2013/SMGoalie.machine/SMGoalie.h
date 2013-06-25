//
// SMGoalie.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGoalie__
#define __clfsm__SMGoalie__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGoalie: public CLMachine
        {
            CLState *_states[5];
        public:
            SMGoalie(int mid  = 0, const char *name = "SMGoalie");
            virtual ~SMGoalie();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMGoalie_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGoalie *CLM_Create_SMGoalie(int mid, const char *name);
}

#endif // defined(__gufsm__SMGoalie__)
