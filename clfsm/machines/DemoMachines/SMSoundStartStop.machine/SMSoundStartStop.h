//
// SMSoundStartStop.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSoundStartStop__
#define __clfsm__SMSoundStartStop__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSoundStartStop: public CLMachine
        {
            CLState *_states[7];
        public:
            SMSoundStartStop(int mid  = 0, const char *name = "SMSoundStartStop");
            virtual ~SMSoundStartStop();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "SMSoundStartStop_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSoundStartStop *CLM_Create_SMSoundStartStop(int mid, const char *name);
}

#endif // defined(__gufsm__SMSoundStartStop__)
