//
// SMTeleoperationHeadControl.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMTeleoperationHeadControl__
#define __clfsm__SMTeleoperationHeadControl__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMTeleoperationHeadControl: public CLMachine
        {
            CLState *_states[5];
        public:
            SMTeleoperationHeadControl(int mid  = 0, const char *name = "SMTeleoperationHeadControl");
            virtual ~SMTeleoperationHeadControl();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMTeleoperationHeadControl_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMTeleoperationHeadControl *CLM_Create_SMTeleoperationHeadControl(int mid, const char *name);
}

#endif // defined(__gufsm__SMTeleoperationHeadControl__)
