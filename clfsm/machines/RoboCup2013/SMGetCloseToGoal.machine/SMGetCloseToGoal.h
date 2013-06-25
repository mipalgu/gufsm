//
// SMGetCloseToGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGetCloseToGoal__
#define __clfsm__SMGetCloseToGoal__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGetCloseToGoal: public CLMachine
        {
            CLState *_states[5];
        public:
            SMGetCloseToGoal(int mid  = 0, const char *name = "SMGetCloseToGoal");
            virtual ~SMGetCloseToGoal();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMGetCloseToGoal_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGetCloseToGoal *CLM_Create_SMGetCloseToGoal(int mid, const char *name);
}

#endif // defined(__gufsm__SMGetCloseToGoal__)
