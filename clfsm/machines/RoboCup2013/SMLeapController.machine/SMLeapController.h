//
// SMLeapController.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMLeapController__
#define __clfsm__SMLeapController__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMLeapController: public CLMachine
        {
            CLState *_states[4];
        public:
            SMLeapController(int mid  = 0, const char *name = "SMLeapController");
            virtual ~SMLeapController();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "SMLeapController_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMLeapController *CLM_Create_SMLeapController(int mid, const char *name);
}

#endif // defined(__gufsm__SMLeapController__)
