//
// SMKicker.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMKicker__
#define __clfsm__SMKicker__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMKicker: public CLMachine
        {
            CLState *_states[22];
        public:
            SMKicker(int mid  = 0, const char *name = "SMKicker");
            virtual ~SMKicker();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 22; }
#           include "SMKicker_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMKicker *CLM_Create_SMKicker(int mid, const char *name);
}

#endif // defined(__gufsm__SMKicker__)
