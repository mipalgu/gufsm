//
// SMFindGoalOnSpot.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMFindGoalOnSpot__
#define __clfsm__SMFindGoalOnSpot__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMFindGoalOnSpot: public CLMachine
        {
            CLState *_states[11];
        public:
            SMFindGoalOnSpot(int mid  = 0, const char *name = "SMFindGoalOnSpot");
            virtual ~SMFindGoalOnSpot();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 11; }
#           include "SMFindGoalOnSpot_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMFindGoalOnSpot *CLM_Create_SMFindGoalOnSpot(int mid, const char *name);
}

#endif // defined(__gufsm__SMFindGoalOnSpot__)
