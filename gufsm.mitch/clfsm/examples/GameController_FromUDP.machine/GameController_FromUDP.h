//
// GameController_FromUDP.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__GameController_FromUDP__
#define __clfsm__GameController_FromUDP__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class GameController_FromUDP: public CLMachine
        {
            CLState *_states[8];
        public:
            GameController_FromUDP(int mid  = 0, const char *name = "GameController_FromUDP");
            virtual ~GameController_FromUDP();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "GameController_FromUDP_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::GameController_FromUDP *CLM_Create_GameController_FromUDP(int mid, const char *name);
}

#endif // defined(__gufsm__GameController_FromUDP__)
