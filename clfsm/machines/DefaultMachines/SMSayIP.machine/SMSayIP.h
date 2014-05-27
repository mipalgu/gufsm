//
// SMSayIP.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMSayIP__
#define __clfsm__SMSayIP__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMSayIP: public CLMachine
        {
            CLState *_states[2];
        public:
            SMSayIP(int mid  = 0, const char *name = "SMSayIP");
            virtual ~SMSayIP();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 2; }
#           include "SMSayIP_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMSayIP *CLM_Create_SMSayIP(int mid, const char *name);
}

#endif // defined(__gufsm__SMSayIP__)
