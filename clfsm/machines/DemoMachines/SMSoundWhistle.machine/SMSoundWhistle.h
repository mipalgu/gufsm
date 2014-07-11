//
// SMSoundWhistle.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSoundWhistle__
#define __clfsm__SMSoundWhistle__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSoundWhistle: public CLMachine
        {
            CLState *_states[8];
        public:
            SMSoundWhistle(int mid  = 0, const char *name = "SMSoundWhistle");
            virtual ~SMSoundWhistle();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "SMSoundWhistle_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSoundWhistle *CLM_Create_SMSoundWhistle(int mid, const char *name);
}

#endif // defined(__gufsm__SMSoundWhistle__)
