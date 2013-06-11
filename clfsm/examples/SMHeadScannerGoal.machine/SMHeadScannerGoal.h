//
// SMHeadScannerGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMHeadScannerGoal__
#define __clfsm__SMHeadScannerGoal__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMHeadScannerGoal: public CLMachine
        {
            CLState *_states[7];
        public:
            SMHeadScannerGoal(int mid  = 0, const char *name = "SMHeadScannerGoal");
            virtual ~SMHeadScannerGoal();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "SMHeadScannerGoal_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMHeadScannerGoal *CLM_Create_SMHeadScannerGoal(int mid, const char *name);
}

#endif // defined(__gufsm__SMHeadScannerGoal__)
