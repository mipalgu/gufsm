//
// SMPlayer.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMPlayer__
#define __clfsm__SMPlayer__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMPlayer: public CLMachine
        {
            CLState *_states[11];
        public:
            SMPlayer(int mid  = 0, const char *name = "SMPlayer");
            virtual ~SMPlayer();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 11; }
#           include "SMPlayer_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMPlayer *CLM_Create_SMPlayer(int mid, const char *name);
}

#endif // defined(__gufsm__SMPlayer__)