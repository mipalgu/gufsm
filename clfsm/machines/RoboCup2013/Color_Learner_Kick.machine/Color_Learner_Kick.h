//
// Color_Learner_Kick.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__Color_Learner_Kick__
#define __clfsm__Color_Learner_Kick__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Color_Learner_Kick: public CLMachine
        {
            CLState *_states[5];
        public:
            Color_Learner_Kick(int mid  = 0, const char *name = "Color_Learner_Kick");
            virtual ~Color_Learner_Kick();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "Color_Learner_Kick_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Color_Learner_Kick *CLM_Create_Color_Learner_Kick(int mid, const char *name);
}

#endif // defined(__gufsm__Color_Learner_Kick__)
