//
// SMSoundDemo.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSoundDemo__
#define __clfsm__SMSoundDemo__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSoundDemo: public CLMachine
        {
            CLState *_states[7];
        public:
            SMSoundDemo(int mid  = 0, const char *name = "SMSoundDemo");
            virtual ~SMSoundDemo();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "SMSoundDemo_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSoundDemo *CLM_Create_SMSoundDemo(int mid, const char *name);
}

#endif // defined(__gufsm__SMSoundDemo__)
