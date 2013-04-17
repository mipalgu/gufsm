//
// SMLeftFootControl.h -- 2013-04-15 04:17:52 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMLeftFootControl__
#define __clfsm__SMLeftFootControl__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMLeftFootControl: public CLMachine
        {
            CLState *_states[4];
        public:
            SMLeftFootControl(int mid  = 0, const char *name = "SMLeftFootControl");
            virtual ~SMLeftFootControl();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMLeftFootControl_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMLeftFootControl *CLM_Create_SMLeftFootControl(int mid, const char *name);
}

#endif // defined(__gufsm__SMLeftFootControl__)
