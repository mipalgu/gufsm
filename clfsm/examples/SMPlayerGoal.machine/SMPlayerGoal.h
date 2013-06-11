//
// SMPlayerGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMPlayerGoal__
#define __clfsm__SMPlayerGoal__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMPlayerGoal: public CLMachine
        {
            CLState *_states[6];
        public:
            SMPlayerGoal(int mid  = 0, const char *name = "SMPlayerGoal");
            virtual ~SMPlayerGoal();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SMPlayerGoal_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMPlayerGoal *CLM_Create_SMPlayerGoal(int mid, const char *name);
}

#endif // defined(__gufsm__SMPlayerGoal__)
