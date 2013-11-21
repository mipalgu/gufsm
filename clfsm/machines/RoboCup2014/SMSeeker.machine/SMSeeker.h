//
// SMSeeker.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSeeker__
#define __clfsm__SMSeeker__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSeeker: public CLMachine
        {
            CLState *_states[8];
        public:
            SMSeeker(int mid  = 0, const char *name = "SMSeeker");
            virtual ~SMSeeker();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "SMSeeker_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSeeker *CLM_Create_SMSeeker(int mid, const char *name);
}

#endif // defined(__gufsm__SMSeeker__)
