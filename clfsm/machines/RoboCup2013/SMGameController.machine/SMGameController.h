//
// SMGameController.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGameController__
#define __clfsm__SMGameController__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGameController: public CLMachine
        {
            CLState *_states[18];
        public:
            SMGameController(int mid  = 0, const char *name = "SMGameController");
            virtual ~SMGameController();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 18; }
#           include "SMGameController_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGameController *CLM_Create_SMGameController(int mid, const char *name);
}

#endif // defined(__gufsm__SMGameController__)
