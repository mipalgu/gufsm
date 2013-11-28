//
// BatNao.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__BatNao__
#define __clfsm__BatNao__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class BatNao: public CLMachine
        {
            CLState *_states[5];
        public:
            BatNao(int mid  = 0, const char *name = "BatNao");
            virtual ~BatNao();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "BatNao_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::BatNao *CLM_Create_BatNao(int mid, const char *name);
}

#endif // defined(__gufsm__BatNao__)
