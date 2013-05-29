//
// OdometryTesting.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__OdometryTesting__
#define __clfsm__OdometryTesting__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class OdometryTesting: public CLMachine
        {
            CLState *_states[3];
        public:
            OdometryTesting(int mid  = 0, const char *name = "OdometryTesting");
            virtual ~OdometryTesting();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "OdometryTesting_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::OdometryTesting *CLM_Create_OdometryTesting(int mid, const char *name);
}

#endif // defined(__gufsm__OdometryTesting__)
