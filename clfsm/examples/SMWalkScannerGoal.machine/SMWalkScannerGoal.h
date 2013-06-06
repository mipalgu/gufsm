//
// SMWalkScannerGoal.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMWalkScannerGoal__
#define __clfsm__SMWalkScannerGoal__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMWalkScannerGoal: public CLMachine
        {
            CLState *_states[3];
        public:
            SMWalkScannerGoal(int mid  = 0, const char *name = "SMWalkScannerGoal");
            virtual ~SMWalkScannerGoal();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "SMWalkScannerGoal_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMWalkScannerGoal *CLM_Create_SMWalkScannerGoal(int mid, const char *name);
}

#endif // defined(__gufsm__SMWalkScannerGoal__)
