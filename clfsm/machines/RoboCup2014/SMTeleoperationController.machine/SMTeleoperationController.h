//
// SMTeleoperationController.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMTeleoperationController__
#define __clfsm__SMTeleoperationController__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMTeleoperationController: public CLMachine
        {
            CLState *_states[9];
        public:
            SMTeleoperationController(int mid  = 0, const char *name = "SMTeleoperationController");
            virtual ~SMTeleoperationController();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "SMTeleoperationController_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMTeleoperationController *CLM_Create_SMTeleoperationController(int mid, const char *name);
}

#endif // defined(__gufsm__SMTeleoperationController__)
