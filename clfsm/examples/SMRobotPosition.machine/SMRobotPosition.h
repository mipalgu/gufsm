//
// SMRobotPosition.h -- 2013-04-15 04:09:28 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMRobotPosition__
#define __clfsm__SMRobotPosition__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMRobotPosition: public CLMachine
        {
            CLState *_states[9];
        public:
            SMRobotPosition(int mid  = 0, const char *name = "SMRobotPosition");
            virtual ~SMRobotPosition();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "SMRobotPosition_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMRobotPosition *CLM_Create_SMRobotPosition(int mid, const char *name);
}

#endif // defined(__gufsm__SMRobotPosition__)
