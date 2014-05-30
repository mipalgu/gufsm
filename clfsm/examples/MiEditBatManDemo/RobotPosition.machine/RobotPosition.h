//
// RobotPosition.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__RobotPosition__
#define __clfsm__RobotPosition__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class RobotPosition: public CLMachine
        {
            CLState *_states[9];
        public:
            RobotPosition(int mid  = 0, const char *name = "RobotPosition");
            virtual ~RobotPosition();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "RobotPosition_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::RobotPosition *CLM_Create_RobotPosition(int mid, const char *name);
}

#endif // defined(__gufsm__RobotPosition__)
