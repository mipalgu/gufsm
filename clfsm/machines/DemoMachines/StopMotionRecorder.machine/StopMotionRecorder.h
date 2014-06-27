//
// StopMotionRecorder.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__StopMotionRecorder__
#define __clfsm__StopMotionRecorder__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class StopMotionRecorder: public CLMachine
        {
            CLState *_states[5];
        public:
            StopMotionRecorder(int mid  = 0, const char *name = "StopMotionRecorder");
            virtual ~StopMotionRecorder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "StopMotionRecorder_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::StopMotionRecorder *CLM_Create_StopMotionRecorder(int mid, const char *name);
}

#endif // defined(__gufsm__StopMotionRecorder__)
