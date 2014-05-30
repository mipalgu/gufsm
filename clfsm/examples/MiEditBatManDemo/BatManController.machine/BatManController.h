//
// BatManController.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__BatManController__
#define __clfsm__BatManController__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class BatManController: public CLMachine
        {
            CLState *_states[4];
        public:
            BatManController(int mid  = 0, const char *name = "BatManController");
            virtual ~BatManController();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "BatManController_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::BatManController *CLM_Create_BatManController(int mid, const char *name);
}

#endif // defined(__gufsm__BatManController__)
