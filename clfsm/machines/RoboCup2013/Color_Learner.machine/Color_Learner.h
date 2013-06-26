//
// Color_Learner.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__Color_Learner__
#define __clfsm__Color_Learner__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Color_Learner: public CLMachine
        {
            CLState *_states[14];
        public:
            Color_Learner(int mid  = 0, const char *name = "Color_Learner");
            virtual ~Color_Learner();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 14; }
#           include "Color_Learner_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Color_Learner *CLM_Create_Color_Learner(int mid, const char *name);
}

#endif // defined(__gufsm__Color_Learner__)
