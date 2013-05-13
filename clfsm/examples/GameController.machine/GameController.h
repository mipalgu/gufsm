//
// GameController.h -- 2013-05-13 03:32:49 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__GameController__
#define __clfsm__GameController__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class GameController: public CLMachine
        {
            CLState *_states[8];
        public:
            GameController(int mid  = 0, const char *name = "GameController");
            virtual ~GameController();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "GameController_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::GameController *CLM_Create_GameController(int mid, const char *name);
}

#endif // defined(__gufsm__GameController__)
