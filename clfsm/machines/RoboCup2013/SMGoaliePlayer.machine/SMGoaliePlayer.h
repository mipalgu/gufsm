//
// SMGoaliePlayer.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGoaliePlayer__
#define __clfsm__SMGoaliePlayer__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGoaliePlayer: public CLMachine
        {
            CLState *_states[5];
        public:
            SMGoaliePlayer(int mid  = 0, const char *name = "SMGoaliePlayer");
            virtual ~SMGoaliePlayer();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMGoaliePlayer_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGoaliePlayer *CLM_Create_SMGoaliePlayer(int mid, const char *name);
}

#endif // defined(__gufsm__SMGoaliePlayer__)
